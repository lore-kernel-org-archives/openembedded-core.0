Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D97E9713BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 10:28:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s84ARbM6016486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Sep 2014 03:27:37 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 03:27:36 -0700
Message-ID: <54083E97.9000005@windriver.com>
Date: Thu, 4 Sep 2014 18:27:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409813992.git.liezhi.yang@windriver.com>		
	<030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>	
	<1409819233.12482.25.camel@ted> <540827B3.50509@windriver.com>
	<1409820816.12482.30.camel@ted>
In-Reply-To: <1409820816.12482.30.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: update the timestamps after install
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
X-List-Received-Date: Thu, 04 Sep 2014 10:28:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2014 04:53 PM, Richard Purdie wrote:
> On Thu, 2014-09-04 at 16:49 +0800, Robert Yang wrote:
>>
>> On 09/04/2014 04:27 PM, Richard Purdie wrote:
>>> On Thu, 2014-09-04 at 00:05 -0700, Robert Yang wrote:
>>>> Update the sstate file's timestamps after it is installed, it will be
>>>> very useful for removing the old sstate file, especially, it's not easy
>>>> to remove when use the shared SSTATE_DIR, we can easily remove them with
>>>> this change, for example:
>>>>
>>>> $ find state-cache -type f -ctime +10 -exec rm -f {} \;
>>>>
>>>> Will remove the sstate file which isn't used by recent 10 days.
>>>>
>>>> We can use the -atime, but it is not always available, for example,
>>>> when mounted with "-o noatime".
>>>>
>>>> The touch is a very light weight action, and the
>>>> scripts/sstate-cache-management.sh also requires this.
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    meta/classes/sstate.bbclass |    1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>>> index ead829e..885912d 100644
>>>> --- a/meta/classes/sstate.bbclass
>>>> +++ b/meta/classes/sstate.bbclass
>>>> @@ -618,6 +618,7 @@ sstate_unpack_package () {
>>>>    	mkdir -p ${SSTATE_INSTDIR}
>>>>    	cd ${SSTATE_INSTDIR}
>>>>    	tar -xmvzf ${SSTATE_PKG}
>>>> +	touch --no-dereference ${SSTATE_PKG}
>>>>    }
>>>>
>>>>    BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
>>>
>>> At the very least we need to consider read only files here...
>>
>> Hello, did you mean the SSTATE_MIRRORS ? I thought that I had
>> considered it since I used the "touch --no-dereference",
>> make a clear check is reasonable if I understand correctly,
>> so updated the code in the repo: (The --no-dereference is not
>> need any more since the "test -w" follows symlink).
>
> We need the --no-dereferece but this could also be a readonly directory

Under more thoughts, yes, we need the --no-dereferece otherwise the
touch may update the file in the SSTATE_MIRRORS, and it's safe to touch
a symlink itself (though "test -w" follows symlink) since the permissions
of symbolic links are never used.

For readonly_dir/ssfile, we can touch the ssfile if "test -w ssfile",
it doesn't care about the dir's write permission. Or do we have to
check the permission of "dirname ${SSTATE_PKG}" and ${SSTATE_DIR} ?
I don't think that we need unless it causes errors.

For the ISO, the "test -w {SSTATE_PKG}" would fail so that no touch,
here is the updated code, also in the repo:

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..78766c0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -618,6 +618,8 @@ sstate_unpack_package () {
         mkdir -p ${SSTATE_INSTDIR}
         cd ${SSTATE_INSTDIR}
         tar -xmvzf ${SSTATE_PKG}
+       # Use "! -w ||" to return true for read only files
+       [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
  }

// Robert

> or set of readonly files (think an ISO shipped with WR Linux or locked
> sstate cache).
>
> Cheers,
>
> Richard
>
>
>

