Return-Path: <sstncr@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 441A26FC63
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jun 2014 11:38:29 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x13so1158849wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jun 2014 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=O9KlGdSlkKMkuNZhNASSgHWYEUkPH2fD7GveGGEPAXg=;
	b=XhC2kTF02bsJipKwIjJzHDpe8WREZ1uK1Tg1Xd/7kSr1Pyy1bWJHESJ9RT53EQEs6E
	UvFFKQFYCacIZafd96yXZV1/DAL3+X/N4vNfwTjahwEaCu7YdewPZN3vTDLIWRkRmVNG
	kKesJKnBX1mZqwV+uFTagbZKKc9tafCTRkr7RjDAGHjm1pF5XHsZX8ANFExGslX1VKH9
	7L/GqcPG7VHJTMiEjiBupo9zTBWOmPMKenu8VHEnH/vtwr8A5CstNsPCKt6f2KWQFlgS
	imfME/nJFk9VEnqPi27kJZQMd2Lsfdm7zHwjGLDKULkYnj4rWZuyP4+Hs0GEvJshGvDY
	PJuw==
MIME-Version: 1.0
X-Received: by 10.180.39.66 with SMTP id n2mr15807902wik.17.1402141109897;
	Sat, 07 Jun 2014 04:38:29 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Sat, 7 Jun 2014 04:38:29 -0700 (PDT)
In-Reply-To: <1402082078-10826-2-git-send-email-corneliux.stoicescu@intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
	<1402082078-10826-2-git-send-email-corneliux.stoicescu@intel.com>
Date: Sat, 7 Jun 2014 14:38:29 +0300
Message-ID: <CANr+NRuOHL7MBQZ3LgkjE3TLZ+62DCOgoO7bAyeV6aeQkK3-HQ@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/7] targetcontrol.py: make possible dynamical determination of rootfs type
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
X-List-Received-Date: Sat, 07 Jun 2014 11:38:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi Corneliu,

On Fri, Jun 6, 2014 at 10:14 PM, Corneliu Stoicescu
<corneliux.stoicescu@intel.com> wrote:
> YB: #6375
>
> Added a new method get_image_fstype() that autodetermines what fstype to use for the rootfs file.
> This method uses a new list variable 'supported_image_fstypes' that contains image fstypes supported by the target controller.
>
> This method is also a classmethod which means outside scripts can get the image fstype.
>
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>  meta/lib/oeqa/targetcontrol.py | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
> index ff1bb89..866c414 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -44,6 +44,8 @@ class BaseTarget(object):
>
>      __metaclass__ = ABCMeta
>
> +    supported_image_fstypes = []
> +
>      def __init__(self, d):
>          self.connection = None
>          self.ip = None
> @@ -70,6 +72,16 @@ class BaseTarget(object):
>      def stop(self):
>          pass
>
> +    @classmethod
> +    def get_image_fstype(self, d, image_fstypes=None):

You made this a static method so you can call it from an external
script? Hmm.. But then you wouldn't be able to pass d, so what's the
point? Adding support for more fs is nice, but you should do that for
testimage, ie make it configurable and let the use choose from
local.conf (with a reasonable default). Right now you are configuring
the test bits from outside...

Cheers,
Stefan

> +        if not image_fstypes:
> +            image_fstypes = d.getVar('IMAGE_FSTYPES', True).split(' ')
> +        possible_image_fstypes = [fstype for fstype in self.supported_image_fstypes if fstype in image_fstypes]
> +        if possible_image_fstypes:
> +            return possible_image_fstypes[0]
> +        else:
> +            bb.fatal("no possible image_fstype could not be determined. IMAGE_FSTYPES=\"%s\" and supported_image_fstypes=\"%s\": " % (', '.join(map(str, image_fstypes)), ', '.join(map(str, self.supported_image_fstypes))))
> +
>      def restart(self, params=None):
>          self.stop()
>          self.start(params)
> @@ -87,13 +99,16 @@ class BaseTarget(object):
>
>  class QemuTarget(BaseTarget):
>
> +    supported_image_fstypes = ['ext3']
> +
>      def __init__(self, d):
>
>          super(QemuTarget, self).__init__(d)
>
> +        self.image_fstype = self.get_image_fstype(d)
>          self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
> -        self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.ext3')
> -        self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
> +        self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
> +        self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
>
>          self.runner = QemuRunner(machine=d.getVar("MACHINE", True),
>                          rootfs=self.rootfs,
> --
> 1.8.3.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

