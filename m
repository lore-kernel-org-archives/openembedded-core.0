Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SGYP1-0006OA-JM
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 18:22:15 +0200
Received: by qcso7 with SMTP id o7so1762823qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Apr 2012 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LgYioyjSUPvMCqWDCuCSz2/hM9Xxf8qmnBKULCWP5Sc=;
	b=TcEvlGXX94uMJgiAwisNS3cbeBSok90ZoDUu8Vf3f/VVHpC51jBvIKtusoktfzK1lt
	1ZweuObrtl05AeJ59I1CVkWgISjKD6kyw3t4avUi/myW8EQbP3lYn9LqF00MZ3VVvTRK
	bm8jOLbE0jXx8sShcZ6B3JjeVuKoIuQyNqQwRG/NtCCdI/ZIGDCp5fea33vsGVMATIRu
	WjXpe63LUaN8ppg7wqjsuNQvgIV2iLT86COQ3uPP1owozI008etxf/Sd2p5xMiAvFz5A
	sUbW/NUePDLFA3yAHYsvBNZ8RZWXq+/lt3shND7puNMNRDaUYTPzY77l/QozTlj79NYX
	3Lxg==
Received: by 10.224.180.1 with SMTP id bs1mr2332478qab.2.1333815180900; Sat,
	07 Apr 2012 09:13:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Sat, 7 Apr 2012 09:12:40 -0700 (PDT)
In-Reply-To: <4F7FD33A.9070801@gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-2-git-send-email-kergoth@gmail.com>
	<4F7FD33A.9070801@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 7 Apr 2012 09:12:40 -0700
X-Google-Sender-Auth: hajg3cSJFtrwWks17nM9iKHNFa0
Message-ID: <CABcZANmN2OK2UB+7mrNn6LKnyZTtu_qucYBBKxfHX6VA74n8sA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] powerpc e500: set -mfloat-gprs=double
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
X-List-Received-Date: Sat, 07 Apr 2012 16:22:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 6, 2012 at 10:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 03/27/2012 12:51 PM, Christopher Larson wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Use of FPRs instead of GPRs is incompatible with e500/SPE, so let's
>> be explicit about the use of GPRs to avoid potential errors. For
>> example, with the Sourcery G++ toolchain, one can hit:
>> conftest.c:1:0: error: E500 and FPRs not supported.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com> ---
>> meta/conf/machine/include/tune-ppce500.inc =C2=A0 | =C2=A0 =C2=A02 +-
>> meta/conf/machine/include/tune-ppce500v2.inc | =C2=A0 =C2=A02 +- 2 files
>> changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/tune-ppce500.inc
>> b/meta/conf/machine/include/tune-ppce500.inc index 1326720..feb1967
>> 100644 --- a/meta/conf/machine/include/tune-ppce500.inc +++
>> b/meta/conf/machine/include/tune-ppce500.inc @@ -7,7 +7,7 @@
>> TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500",
>> "-mcpu=3D8540", " TUNE_PKGARCH_tune-ppce500 =3D "ppce500"
>>
>> TUNEVALID[spe] =3D "Enable SPE ABI extensions" -TUNE_CCARGS +=3D
>> "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=3Dspe -mspe",
>> "", d)}" +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES",
>> "spe", "-mabi=3Dspe -mspe -mfloat-gprs=3Ddouble", "", d)}"
>>
>
> IIRC e500v1 does not have double precision floating point support.

Yeah, I know, I sent a later patch to fix it, but Mark already fixed
it in his tuning rework. :)
--=20
Christopher Larson


