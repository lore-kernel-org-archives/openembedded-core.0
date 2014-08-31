Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C188A65D34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 05:25:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7V5PWWX029045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 30 Aug 2014 22:25:34 -0700 (PDT)
Received: from server.local (128.224.20.92) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 30 Aug 2014 22:25:31 -0700
Message-ID: <5402B1CB.1060803@windriver.com>
Date: Sun, 31 Aug 2014 01:25:31 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>	
	<efcd26d4f457c8f5f658a1a3ab9e5c2aa03a6a65.1409345003.git.bruce.ashfield@windriver.com>
	<1409406941.29296.216.camel@ted>
In-Reply-To: <1409406941.29296.216.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/18] kernel-yocto: move SRCREV validation to patching phase
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Aug 2014 05:25:37 -0000
X-Groupsio-MsgNum: 57252
Content-Type: multipart/mixed; boundary="------------010003070302000600030500"

--------------010003070302000600030500
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-30, 9:55 AM, Richard Purdie wrote:
> On Sat, 2014-08-30 at 00:38 -0400, Bruce Ashfield wrote:
>> Rather than attempting to condition the entire tree to machine SRCREV (since
>> we don't know what branch will be built), we can instead wait until patching
>> has completed and then confirm that we are indeed building a decendant of the
>> specified SRCREV. The result is a much simpler check, and no mangling of the
>> tree.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/classes/kernel-yocto.bbclass | 39 +++++++++++++++++++++++----------------
>>   1 file changed, 23 insertions(+), 16 deletions(-)
>
> Looks like some versions of git on the AB cluster don't support this. Do
> we need to bump the minimum git version and install buildtools-tarball
> on the affected machines? Or can we use some other construct here?
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/24/steps/BuildImages/logs/stdio
>

I pushed a patch to my contrib kernel/zedd patch that should address this,
and I've also attached it here.

We simply switch back to the more basic commands, and will worry about
--is-ancestor at some point in the future :)

This passed my two tests here.

Bruce

> Cheers,
>
> Richard
>
>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 38c886b21b09..4938712c7cff 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -71,6 +71,7 @@ do_patch() {
>>   	fi
>>
>>   	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>> +	machine_srcrev="${SRCREV_machine}"
>>
>>   	# if we have a defined/set meta branch we should not be generating
>>   	# any meta data. The passed branch has what we need.
>> @@ -122,6 +123,17 @@ do_patch() {
>>   		exit 1
>>   	fi
>>
>> +	# see if the branch we are about to patch has been properly reset to the defined
>> +	# SRCREV .. if not, we reset it.
>> +	branch_head=`git rev-parse HEAD`
>> +	if [ "${machine_srcrev}" != "AUTOINC" ]; then
>> +	 	if [ "${machine_srcrev}" != "${branch_head}" ]; then
>> +			current_branch=`git rev-parse --abbrev-ref HEAD`
>> +			git branch "$current_branch-orig"
>> +			git reset --hard ${machine_srcrev}
>> +		fi
>> +	fi
>> +
>>   	# executes and modifies the source tree as required
>>   	patchme ${KMACHINE}
>>   	if [ $? -ne 0 ]; then
>> @@ -130,6 +142,17 @@ do_patch() {
>>   		exit 1
>>   	fi
>>
>> +	# check to see if the specified SRCREV is reachable from the final branch.
>> +	# if it wasn't something wrong has happened, and we should error.
>> +	if [ "${machine_srcrev}" != "AUTOINC" ]; then
>> +		git merge-base --is-ancestor ${machine_srcrev} HEAD
>> +	 	if [ $? -ne 0 ]; then
>> +			bbnote "ERROR: SRCREV ${machine_srcrev} was specified, but is not reachable"
>> +			bbnote "       Check the BSP description for incorrect branch selection, or other errors."
>> +			exit 1
>> +		fi
>> +	fi
>> +
>>   	# Perform a final check. If something other than the default kernel
>>   	# branch was requested, and that's not where we ended up, then we
>>   	# should thrown an error, since we aren't building what was expected
>> @@ -335,22 +358,6 @@ do_validate_branches() {
>>   		exit 1
>>   	fi
>>
>> -	# force the SRCREV in each branch that contains the specified
>> -	# SRCREV (if it isn't the current HEAD of that branch)
>> -	git checkout -q master
>> -	for b in $containing_branches; do
>> -		branch_head=`git show-ref -s --heads ${b}`		
>> -		if [ "$branch_head" != "$machine_srcrev" ]; then
>> -			echo "[INFO] Setting branch $b to ${machine_srcrev}"
>> -			if [ "$b" = "master" ]; then
>> -				git reset --hard $machine_srcrev > /dev/null
>> -			else
>> -				git branch -D $b > /dev/null
>> -				git branch $b $machine_srcrev > /dev/null
>> -			fi
>> -		fi
>> -	done
>> -
>>   	## KMETA branch validation.
>>   	## We do validation if the meta branch exists, and AUTOREV hasn't been set
>>    	meta_head=`git show-ref -s --heads ${KMETA}`
>
>


--------------010003070302000600030500
Content-Type: application/mbox;
	name="0001-kernel-yocto-replace-is-ancestor-with-basic-git-porc.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-kernel-yocto-replace-is-ancestor-with-basic-git-porc.pa";
	filename*1="tch"

RnJvbSBkZWJiNDg0YmY2M2JlNTgzY2E3ZmRjOWM0MjkwOGRiODc5NTQ1ZWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogU3VuLCAzMSBBdWcgMjAxNCAwMToxODoyNCAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIGtlcm5lbC15b2N0bzogcmVwbGFjZSAtLWlzLWFuY2VzdG9yIHdpdGggYmFzaWMgZ2l0
IHBvcmNlbGFpbgogY29tbWFuZHMKCi0taXMtYW5jZXN0b3IgaXMgYSByZWxhdGl2ZWx5IG5ldyBn
aXQgb3B0aW9uIFtjb21taXQgNTkwN2NkYTEsIEF1ZyAzMCAyMDEyXS4KVG8gc3VwcG9ydCBidWls
ZCBtYWNoaW5lcyB3aXRoIG9sZGVyIHZlcnNpb25zIG9mIGdpdCBpbnN0YWxsZWQsIHdlIGNhbiB1
c2UKdGhlIGJhc2ljIHBvcmNlbGFpbiBjb21tYW5kcyB0byBhY2hlaXZlIHRoZSBzYW1lIGNoZWNr
LgoKbWVyZ2UtYmFzZTogIi0taXMtYW5jZXN0b3IgQSBCIiBjYW4gYmUgcmVwbGFjZWQgd2l0aDoK
CiAgICBpZiB0ZXN0ICIkKGdpdCByZXYtcGFyc2UgLS12ZXJpZnkgQSkiID0gIiQoZ2l0IG1lcmdl
LWJhc2UgQSBCKSIKClNpZ25lZC1vZmYtYnk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVs
ZEB3aW5kcml2ZXIuY29tPgotLS0KIG1ldGEvY2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcyB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNzIGIvbWV0YS9jbGFz
c2VzL2tlcm5lbC15b2N0by5iYmNsYXNzCmluZGV4IGVlMDk3NjlkNDYxNi4uOTI5ZDY0YTI5MDIy
IDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3MKKysrIGIvbWV0
YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNzCkBAIC0xMzEsOCArMTMxLDcgQEAgZG9fcGF0
Y2goKSB7CiAJIyBjaGVjayB0byBzZWUgaWYgdGhlIHNwZWNpZmllZCBTUkNSRVYgaXMgcmVhY2hh
YmxlIGZyb20gdGhlIGZpbmFsIGJyYW5jaC4KIAkjIGlmIGl0IHdhc24ndCBzb21ldGhpbmcgd3Jv
bmcgaGFzIGhhcHBlbmVkLCBhbmQgd2Ugc2hvdWxkIGVycm9yLgogCWlmIFsgIiR7bWFjaGluZV9z
cmNyZXZ9IiAhPSAiQVVUT0lOQyIgXTsgdGhlbgotCQlnaXQgbWVyZ2UtYmFzZSAtLWlzLWFuY2Vz
dG9yICR7bWFjaGluZV9zcmNyZXZ9IEhFQUQKLQkgCWlmIFsgJD8gLW5lIDAgXTsgdGhlbgorCQlp
ZiAhIFsgIiQoZ2l0IHJldi1wYXJzZSAtLXZlcmlmeSAke21hY2hpbmVfc3JjcmV2fSkiID0gIiQo
Z2l0IG1lcmdlLWJhc2UgJHttYWNoaW5lX3NyY3Jldn0gSEVBRCkiIF07IHRoZW4KIAkJCWJiZXJy
b3IgIlNSQ1JFViAke21hY2hpbmVfc3JjcmV2fSB3YXMgc3BlY2lmaWVkLCBidXQgaXMgbm90IHJl
YWNoYWJsZSIKIAkJCWJiZmF0YWwgIkNoZWNrIHRoZSBCU1AgZGVzY3JpcHRpb24gZm9yIGluY29y
cmVjdCBicmFuY2ggc2VsZWN0aW9uLCBvciBvdGhlciBlcnJvcnMuIgogCQlmaQotLSAKMS44LjEu
MgoK

--------------010003070302000600030500--
