Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1ShgjX-00029T-PM
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:43:36 +0200
Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Jun 2012 05:32:37 -0700
Received: by vcbfk26 with SMTP id fk26so257295vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 05:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=sTezhY+f1Bx5jrnLdM2SEeI41pzHdNdE2b6KcWPTyZI=;
	b=NjeXtUmnjmqF6bJ4eDyaj+cclGmsO97sHB9XI9aq+kxtYX7yPRRYtJnoYjNGRp0fgz
	20eq7Gv0HYc5PcKHvz4User+gGw/v4MXxsCr1P84+x1QsChyQvoYkYsI3hqudWl97QmD
	lP0ujUaDbiPuG+JzJRIcnrg4Ntxs50aAKwMGr5gRqtSnUmBPcZowzL5JSvg14pRjEr0M
	JdfeTaRx7C4CpIvbe2l6Rbi1bgDJN4Ra6FjrzhVa29Bz7OwAoVpvAHmHM6KzSPXfTY99
	rne3Cf3Ts/i2FTDufEnLXluusGDxPNqN87Bb+nWux07NDHRBg3p9TfNCHPYKssQH0IWu
	c7ow==
Received: by 10.220.228.193 with SMTP id jf1mr4375394vcb.73.1340281956920;
	Thu, 21 Jun 2012 05:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.34.208 with HTTP; Thu, 21 Jun 2012 05:32:16 -0700 (PDT)
In-Reply-To: <1340281789.1640.106.camel@ted>
References: <1340180732-26710-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1340281789.1640.106.camel@ted>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 21 Jun 2012 15:32:16 +0300
Message-ID: <CAMZjud0p_349MXBVFUj4q-jxKy0S+1bz3_onEjx16XdkKtRPQw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlwxOKPlp8ggS2xJd1ea+Qndj/4qGX3ucXKTF8o90VGuRASAYJ9W/Ja46Z6GrJJ6QR7cqRf
Subject: Re: [PATCH] linux-tools: multilib compilation fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 12:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 3:29 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-06-20 at 11:25 +0300, Bogdan Marinescu wrote:
>> This patch makes linux-tools compile properly on multilib configurations
>> (which failed because of some invalid dependencies). Tested by compiling
>> lib32-core-image-sato-sdk.
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>> =A0meta/recipes-kernel/linux/linux-tools.inc | =A0 =A02 +-
>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-ke=
rnel/linux/linux-tools.inc
>> index 3b03c05..048608c 100644
>> --- a/meta/recipes-kernel/linux/linux-tools.inc
>> +++ b/meta/recipes-kernel/linux/linux-tools.inc
>> @@ -34,7 +34,7 @@ do_install_perf[umask] =3D "022"
>>
>> =A0PERFDEPENDS =3D "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREF=
IX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
>> =A0PERFDEPENDS_libc-uclibc =3D ""
>> -PERFRDEPENDS =3D "python perl elfutils"
>> +PERFRDEPENDS =3D "${MLPREFIX}python ${MLPREFIX}perl ${MLPREFIX}elfutils=
"
>> =A0PERFRDEPENDS_libc-uclibc =3D ""
>>
>> =A0do_compile_perf[depends] =3D "${PERFDEPENDS}"
>
> Bruce has just totally rearranged this code. Could you check if the new
> recipe still suffers from this issue please?

Sure, I'm on it.

Thanks,
Bogdan

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


