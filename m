Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCZFx-0007y1-Rk
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 19:00:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8EGm6mc018312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 09:48:06 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 14 Sep 2012 09:48:05 -0700
Message-ID: <50535FC5.9040802@windriver.com>
Date: Fri, 14 Sep 2012 11:48:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<22844638.2V3OiWsK3u@helios> <5052617D.7080206@linux.intel.com>
	<1347638477.13596.21.camel@ted>
In-Reply-To: <1347638477.13596.21.camel@ted>
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 17:00:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/12 11:01 AM, Richard Purdie wrote:
> On Thu, 2012-09-13 at 15:43 -0700, Saul Wold wrote:
>> On 09/13/2012 03:31 PM, Paul Eggleton wrote:
>>> On Thursday 13 September 2012 12:26:19 Saul Wold wrote:
>>>> Make sure to find -package, this was causing a failure
>>>> in the multi-lib build license generation during rootfs.
>>>>
>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>> ---
>>>>    meta/classes/license.bbclass |    2 +-
>>>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>>>> index 29fe938..b29067c 100644
>>>> --- a/meta/classes/license.bbclass
>>>> +++ b/meta/classes/license.bbclass
>>>> @@ -88,7 +88,7 @@ license_create_manifest() {
>>>>    	# list of installed packages is broken for deb
>>>>    	for pkg in ${INSTALLED_PKGS}; do
>>>>    		# not the best way to do this but licenses are not arch dependant iirc
>>>> -		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
>>>> +		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
>>>>    		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
>>>>
>>>>    		# exclude locale recipes
>>>
>>> Surely this could end up matching a the wrong file when one package name is a
>>> substring of another?
>>>
>> I am open to ideas here, I tried the ${MLPREFIX}, but it seems to be
>> empty when rootfs runs, that did not help, I thought about adding the
>> '-', but that would fail in the non-multilib case, how can I determine
>> what the prefix will be to get a more accurate match?
>
> I would observe here that this probably works for ipk and multilib and
> only breaks for multilib+rpm. The reason is that rpm collapses the
> namespace when it creates the package list so "lib32-bash" becomes bash.
> I think this might be an error in however we generate the INSTALLED_PKGS
> list and we might need to revisit the rpm mechanism and ensure the
> multilib prefixes get added.

RPM has internal mechanisms to tag both the filetypes and architectures as being 
different, unlike most of the other packaging formats which assume a package 
with the same name is the same.

The way to deal with this is via the mapping actions.  You should be able to map 
from ML_PREFIX-${PN} to ${PN}.${ARCH} and of course the reverse...

How it works....

So during package generation we know the package arch is unique and just strip 
off the mlprefix.  To do the reverse iterate over all of the available 
MULTILIBS, there is code in rootfs_rpm.bbclass already to do this.  Then 
reconstruct the package name based on the multilib configuration.

--Mark


> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



