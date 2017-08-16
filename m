Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE4BF78356
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 15:36:29 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id y96so16128440wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RMv999ZFtoy6aHxL779BA5bVTowlAmfUV2ogEXNhTz8=;
	b=tXXqlkQhBTa7nmHeGT8takrfJrYsX2Mz0CBePKZmvML+5/hRk3ZWOD/bLTJF8s7IbS
	ju8ZHsZuEUTqpfQ0+2kQTwuzsPduHYtfr7ZFcchexsNtNISl4uSHjofwvoABdyBfjYPY
	k7UoNAE/bI7lgouX7J79YG32hGZ7O3++gWZJnBSJdtlRDxNjMgQbMtasGpdJUUY1oP3x
	lZuUb2Nr72riCysmsPn044pdFfLhPsf6a46kwaLQfMYZoPIJ1v/VcR0OAeUMQfgNjUWy
	jJL1/4Eu9Y+ZkBKpKgMmDpYsHjUuoLswwskGh1sXjCEePTxiq7KCwXgdCv0N9gTz5VKB
	Tzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RMv999ZFtoy6aHxL779BA5bVTowlAmfUV2ogEXNhTz8=;
	b=MB3FPcSO9HeDlR02gcJXv2Fw69aQqEmbLK6J1SuKzOd/F7hRwKTgqAxM/FfpVueA/1
	1fNjrbUV7R/M9dLa5plxLapGzvWACGVjBo+fjq1zbDERCuDTTKzTeqvJr3zJtk4hLAVX
	ENr5rZ4vj0eDm3ZtIfkH5xZ+sT2Gx2hHrUDYQlpfc/mDOuVau9S3v1ux2awCd1cCsG1/
	3YrojjvDCM2aH98l2fuoCqSekcdsm7oZ+1RTmR3P0o+8/mP1zBLGMt6PCLgvWiYE//Yt
	0viFykRw3XjHhK3iL92eD1uG3ibo9NMGhaXbbYeXMOYe4ko5GMcWpZx8fVldK+3YnnY3
	IlVQ==
X-Gm-Message-State: AHYfb5h7LkEsP81Jim68x25PWe+L206kkZ+ko/e1KEJpuP5CjfSf7KQ1
	I9qgdU9LM46DJ5w7Vr6tI/Qp5sjaYlA7
X-Received: by 10.223.133.206 with SMTP id 14mr1426253wru.6.1502897790605;
	Wed, 16 Aug 2017 08:36:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 16 Aug 2017 08:36:30 -0700 (PDT)
In-Reply-To: <716364F9-E9E1-4941-97FA-90D9434E518E@linux.intel.com>
References: <20170815214002.55130-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<62f0c732-87f3-9af6-3380-b9fd863f216c@windriver.com>
	<716364F9-E9E1-4941-97FA-90D9434E518E@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 16 Aug 2017 08:36:30 -0700
Message-ID: <CAJ86T=VJv6SsrLdvtAsJSKhtJJ2M5gXsRwv7pP8uB4DgHeubnA@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gpg_sign: perform rpm signing serially
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
X-List-Received-Date: Wed, 16 Aug 2017 15:36:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 5:28 AM, Markus Lehtonen
<markus.lehtonen@linux.intel.com> wrote:
> I agree. I don't see reason for dropping parallelism completely. There is a real gain when running on beefier machines. Making it configurable would probably be best. Or just drop it to a saner value, like 20 or 10.

Deriving a value from PARALLEL_MAKE or BB_NUMBER_THREADS might be
better than defining a new variable or hardcoding.

>    - Markus
>
> On 16/08/2017, 2.53, "Mark Hatle" <openembedded-core-bounces@lists.openembedded.org on behalf of mark.hatle@windriver.com> wrote:
>
>     It would probably be better if this was configurable with a 'safe' default.
>
>     Moving from parallel to single will greatly affect the overall performance on
>     larger build machines (lots of memory and cores) that can handle the load vs a
>     typical development machine.
>
>     --Mark
>
>     On 8/15/17 4:40 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>     > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>     >
>     > gpg signing in file batches (which was default to 100) is a memory expensive
>     > computation, causing trouble in some host machines (even on production AB
>     > as seen on the bugzilla ID). Also, in terms of performance, there is no real
>     > gain when rpm signing is done in batches. Considering the latter issues, perform the
>     > rpm signing serially.
>     >
>     > Log showing errors observed recently at AB workers:
>     >
>     >     | gpg: signing failed: Cannot allocate memory
>     >     | gpg: signing failed: Cannot allocate memory
>     >     | error: gpg exec failed (2)
>     >     | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.5.29-r0/deploy-rpms/core2_64/base-passwd-dev-3.5.29-r0.core2_64.rpm:
>     >
>     > [YOCTO #11914]
>     >
>     > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>     > ---
>     >  meta/lib/oe/gpg_sign.py | 6 +++---
>     >  1 file changed, 3 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>     > index f4d8b10e4b..5c7985a856 100644
>     > --- a/meta/lib/oe/gpg_sign.py
>     > +++ b/meta/lib/oe/gpg_sign.py
>     > @@ -45,9 +45,9 @@ class LocalSigner(object):
>     >              if fsk_password:
>     >                  cmd += "--define '_file_signing_key_password %s' " % fsk_password
>     >
>     > -        # Sign in chunks of 100 packages
>     > -        for i in range(0, len(files), 100):
>     > -            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+100]))
>     > +        # Sign packages
>     > +        for f in files:
>     > +            status, output = oe.utils.getstatusoutput(cmd + ' ' + f)
>     >              if status:
>     >                  raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
>     >
>     >
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

