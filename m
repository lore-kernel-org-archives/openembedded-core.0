Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 502EF731D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 14:56:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0DEuDdm003185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 06:56:13 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 13 Jan 2016 06:56:12 -0800
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
References: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1452528799-11292-4-git-send-email-markus.lehtonen@linux.intel.com>
	<5693D956.40107@windriver.com>
	<1452615851.13987.6.camel@linux.intel.com>
	<1452680933.13987.10.camel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5696658C.4020903@windriver.com>
Date: Wed, 13 Jan 2016 08:56:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1452680933.13987.10.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oe.gpg_sign: support obs-signd
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
X-List-Received-Date: Wed, 13 Jan 2016 14:56:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 1/13/16 4:28 AM, Markus Lehtonen wrote:
> Hi,
> 
> On Tue, 2016-01-12 at 18:24 +0200, Markus Lehtonen wrote:
>> Hi Mark,
>>
>> Thank you for your review! Comments below.
>>
>> On Mon, 2016-01-11 at 10:33 -0600, Mark Hatle wrote:
>>> On 1/11/16 10:13 AM, Markus Lehtonen wrote:
>>>> Implement support for remote signing using obs-signd. It is now possible
>>>> to sign both RPM packages and package feeds with this method. The user
>>>> just needs to set RPM_GPG_BACKEND and/or PACKAGE_FEED_GPG_BACKEND
>>>> variables to 'obssign' in the bitbake config. Of course, in addition,
>>>> one needs to setup the signing server and the configure the 'sign'
>>>> client command on the build host. The *_PASSPHRASE_FILE settings are not
>>>> used when the obssign backend is enabled.
>>>>
>>>> [YOCTO #8755]
>>>>
>>>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>>>> ---
>>>>  meta/classes/sign_package_feed.bbclass |  5 +++-
>>>>  meta/classes/sign_rpm.bbclass          |  5 +++-
>>>>  meta/lib/oe/gpg_sign.py                | 48 ++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 56 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
>>>> index d5df8af..953fa85 100644
>>>> --- a/meta/classes/sign_package_feed.bbclass
>>>> +++ b/meta/classes/sign_package_feed.bbclass
>>>> @@ -24,7 +24,10 @@ PACKAGE_FEED_GPG_BACKEND ?= 'local'
>>>>  
>>>>  python () {
>>>>      # Check sanity of configuration
>>>> -    for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
>>>> +    required = ['PACKAGE_FEED_GPG_NAME']
>>>> +    if d.getVar('PACKAGE_FEED_GPG_BACKEND', True) != 'obssign':
>>>> +        required.append('PACKAGE_FEED_GPG_PASSPHRASE_FILE')
>>>> +    for var in required:
>>>>          if not d.getVar(var, True):
>>>>              raise_sanity_error("You need to define %s in the config" % var, d)
>>>>  
>>>> diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
>>>> index 8bcabee..8be1c35 100644
>>>> --- a/meta/classes/sign_rpm.bbclass
>>>> +++ b/meta/classes/sign_rpm.bbclass
>>>> @@ -23,7 +23,10 @@ RPM_GPG_BACKEND ?= 'local'
>>>>  
>>>>  python () {
>>>>      # Check configuration
>>>> -    for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE_FILE'):
>>>> +    required = ['RPM_GPG_NAME']
>>>> +    if d.getVar('RPM_GPG_BACKEND', True) != 'obssign':
>>>> +        required.append('RPM_GPG_PASSPHRASE_FILE')
>>>> +    for var in required:
>>>>          if not d.getVar(var, True):
>>>>              raise_sanity_error("You need to define %s in the config" % var, d)
>>>>  
>>>> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>>>> index 55abad8..d8ab816 100644
>>>> --- a/meta/lib/oe/gpg_sign.py
>>>> +++ b/meta/lib/oe/gpg_sign.py
>>>> @@ -66,11 +66,59 @@ class LocalSigner(object):
>>>>                                        (input_file, output))
>>>>  
>>>>  
>>>> +class ObsSigner(object):
>>>> +    """Class for handling signing with obs-signd"""
>>>> +    def __init__(self, keyid):
>>>> +        self.keyid = keyid
>>>> +        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
>>>> +
>>>> +    def export_pubkey(self, output_file):
>>>> +        """Export GPG public key to a file"""
>>>> +        cmd = "sign -u '%s' -p" % self.keyid
>>>> +        status, output = oe.utils.getstatusoutput(cmd)
>>>> +        if status:
>>>> +            raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
>>>> +                                      (self.keyid, output))
>>>> +        with open(output_file, 'w') as fobj:
>>>> +            fobj.write(output)
>>>> +            fobj.write('\n')
>>>> +
>>>> +    def sign_rpms(self, files):
>>>> +        """Sign RPM files"""
>>>> +        import pexpect
>>>> +
>>>> +        # Remove existing signatures
>>>> +        cmd = "%s --delsign %s" % (self.rpm_bin, ' '.join(files))
>>>
>>> Why are you removing existing signatures?  I believe for many cases this is
>>> actually incorrect.
>>>
>>> RPM (5) has the ability to have an endless number of signatures within a given
>>> package.  The package SHOULD included the internal non-repudiable signature...
>>>
>>> (to refresh memory) all RPM 5 packages include an internal non-repudiable
>>> signature.  Think of this as an extended md5sum, sha256sum, etc.  It doesn't
>>> change that a package is 'authentic' in any way (often the purpose of signatures
>>> like what this code is doing), but instead keeps a high reliability way to sign
>>> and verify the package is signed properly.
>>>
>>> This is used for validation if the system doing the install does not have the
>>> public key that the package was signed with.
>>>
>>> ... as well as one or more repudiable signatures that can be used to verify that
>>> it's "authentic" in some way.  A system could very easily have OSV, OEM, and ISV
>>> keys install on them.  You can program RPM in such a way that it will refused to
>>> install packages with unknown authentication keys or the non-repudiable key as well.
>>>
>>> So, I believe running delsign is wrong.  If the obs-signd can't handle ADDING
>>> signatures to packages, then I'd say it is broken and should be fixed in some
>>> way -- or at least the signature deletion code should be optional.
>>
>> Yes, unfortunately this is currently the limitation of obs-signd. It
>> refuses to sign if there are signatures present in the rpm package.
>> Using --delsign is "unfortunate" consequence of this and that should've
>> probably been described in a comment. Making signature deletion a
>> configurable setting is hopefully a decent resolution for now. I will
>> send a new version of the patchset later.
> 
> Backing up a bit here. I did some quick testing and it seems that RPM5
> does not support multiple signatures (anymore?). Doing --addsign seems
> to overwrite the existing signatures similarly to --resign. Support for
> multiple signatures were removed from RPM4 years ago.
> 
> In this light, doing --delsign should be ok. What do you think?

I'll have to double check, but I used multiple signature support about 6 months
ago with the YP 2.0 (still current oe version) version of RPM.

Are you using the correct rpm signing tool?  If you sign using RPM4's tool, then
you can get the behavior you are talking about.

(The easiest way to verify the signing is 'multiple' was via a debug flag, I
don't remember if rpm -K -vvvv <package> was the right approach of if it was a
more specific one, but the debugging clearly showed it loading multiple signatures.)

--Mark

> 
> Thanks,
>   Markus
> 


