Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1887F610F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 15:32:58 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so9964237obb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=HxQaFKs2/VVdC4wczWlPuilC4FLbDWeZVJ9WNtzN3xU=;
	b=1FW6b89hMwIsMHVl2ULtnusOTUrBVIbC1+9KPdiItd7ilcnyuMBxbtJ7/MIte0gXa+
	g1L+wZPKsRbkxlZsZtoUu9gbSQuGy2OoAZ5f+ug8T0kdlt3HeuJ8z1xjENuyNBI3Ebm4
	r2fEzYgrIFVoKyEaipMenjMHx7xTDbb05wOqTdiWJgYbiq9Smklbv3iC0QcKL0maTBp2
	sjR/5eex7Sf1tyaDwSVMsC0RVh/41kwEQ9EhM96SDS+BlRoBqj9E6t6u301o6UMlxmzn
	B0snGb8HPw3pTAp1RlCauKAX2zY4DDIBEl8U2o9VSofVgDD/MgxNTpuCx/PrF5tVPGCl
	iSqg==
MIME-Version: 1.0
X-Received: by 10.60.80.167 with SMTP id s7mr1686252oex.38.1379604779507; Thu,
	19 Sep 2013 08:32:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 19 Sep 2013 08:32:59 -0700 (PDT)
In-Reply-To: <CAFyqS9pDpKoNTk8dgJ5Xkbzmy8YXWX=PZEbbohhotuXr25MYmA@mail.gmail.com>
References: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
	<1379597321-5447-3-git-send-email-otavio@ossystems.com.br>
	<CAFyqS9pDpKoNTk8dgJ5Xkbzmy8YXWX=PZEbbohhotuXr25MYmA@mail.gmail.com>
Date: Thu, 19 Sep 2013 12:32:59 -0300
X-Google-Sender-Auth: xoOeMhJ2Hv0YIpnJDI0YkDnJ43c
Message-ID: <CAP9ODKoXnLikZrm_HLWqFgdz7XsLY9UVAgmPMg_CjyX3=XvKAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] uboot-config.bbclass: Handle UBOOT_MACHINE setting
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
X-List-Received-Date: Thu, 19 Sep 2013 15:32:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2013 at 12:25 PM, Hans Beck=E9rus <hans.beckerus@gmail.com>=
 wrote:
> On Thu, Sep 19, 2013 at 3:28 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> The class now consolidate the handle of UBOOT_MACHINE and UBOOT_CONFIG
>> variables and handle possible mistakes done by user when using these
>> variables.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/uboot-config.bbclass | 18 +++++++++++++++++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-conf=
ig.bbclass
>> index 44b46ff..b81cc60 100644
>> --- a/meta/classes/uboot-config.bbclass
>> +++ b/meta/classes/uboot-config.bbclass
>> @@ -1,14 +1,30 @@
>> -# Allow easy override of U-Boot config for a machine
>> +# Handle U-Boot config for a machine
>>  #
>>  # The format to specify it, in the machine, is:
>>  #
>>  # UBOOT_CONFIG ??=3D <default>
>>  # UBOOT_CONFIG[foo] =3D "config,images"
>>  #
>> +# or
>> +#
>> +# UBOOT_MACHINE =3D "config"
>> +#
>>  # Copyright 2013 (C) O.S. Systems Software LTDA.
>>
>>  python () {
>> +    ubootmachine =3D d.getVar("UBOOT_MACHINE", True)
>>      ubootconfigflags =3D d.getVarFlags('UBOOT_CONFIG')
>> +
>> +    if not ubootmachine and not ubootconfigflags:
>> +        PN =3D d.getVar("PN", True)
>> +        FILE =3D os.path.basename(d.getVar("FILE", True))
>> +        bb.debug(1, "To build %s, see %s for instructions on \
>> +                 setting up your machine config" % (PN, FILE))
>> +        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFI=
G are must be set in the %s machine configuration." % d.getVar("MACHINE", T=
rue))
>> +
> Minor grammar error;  UBOOT_CONFIG are must >  UBOOT_CONFIG must
>
>> +    if ubootmachine and ubootconfigflags:
>> +        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UB=
OOT_CONFIG at same time.")
>> +
> Minor grammar error;  at same time -> at the same time

Thanks; I fixed both in my local tree and will wait some more time for
feedback and I send a v2.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

