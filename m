Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B6CC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 16:17:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.25883.1714407456859219038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 09:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EJqIj1zA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so41914755e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714407455; x=1715012255; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmvmN2eZsutubI8kQH1DEI86uT8pYTALtxjXcqG+9IQ=;
        b=EJqIj1zAT6ehpRfBw6MAmfIygvyQmUvCU6NpzLyyYime3lKowq2pxEqSgABRVnf4+v
         l+8CBapNoLiRvuZBUnWZvCLqQHBsKyaOEc88MSWL9PuMN5xgrKeMn4Ttco+vpuOZAQEp
         UplAS0xMnA1RJyj5utFvm9373t2yI924U9YjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407455; x=1715012255;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmvmN2eZsutubI8kQH1DEI86uT8pYTALtxjXcqG+9IQ=;
        b=ZgpNHd5ueKJPkf+EIb5ksIeCJvLjev22S16Vm4orflUG9KZ8WJr+gdoGUhVmQdvKKR
         xgugS8ZxIR+SiM8Jzg21l+aqvwcVK4X8gq+7J3YK03B4H4Ye4/7B0ejfz0NJzvGlmbsV
         toWIp0uoKh2mM1r+bC0FzrxKCrb81WtYQT9PTIL59X8FXmH/upLTde928g7AzFYpxseT
         jlrbab6OxVrLCbOD+IsJKoUtxT2YWJGc4p9e097/l09kzVfrWmvYPNexk45MJoCacaAj
         pE86g4gex5zPd+G5zhvry1pukgVkJKuKAUdVjhYLgtMZWKwVMGtncK5CRoxv7yXo0wmx
         OdeQ==
X-Gm-Message-State: AOJu0YxmAG867PbPJmnCD1dKeBwMSvzdUNAb3kgrDdUdEzojhioEqnde
	e9JqdSPbw4IQI+EX2s2wpw+9K5QiI7ZkXkmjv/V6yEy4tilUwlvSP0L97M7TKEIt/+bCHTxt4js
	6tLk=
X-Google-Smtp-Source: AGHT+IEf40I9gdXIyVutz19tdY2wIuzK/yEVjVU3iFvywk8TfSZGUVB4s6JWsUrfUZkUjzY/PKUuBw==
X-Received: by 2002:a05:600c:1c13:b0:41c:503:9ae4 with SMTP id j19-20020a05600c1c1300b0041c05039ae4mr5715260wms.25.1714407455093;
        Mon, 29 Apr 2024 09:17:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3369:32ae:27f:46ba? ([2001:8b0:aba:5f3c:3369:32ae:27f:46ba])
        by smtp.gmail.com with ESMTPSA id d7-20020a05600c34c700b0041b086d664fsm20303556wmq.6.2024.04.29.09.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 09:17:34 -0700 (PDT)
Message-ID: <45cff2cc9fd202fef34b7a745da30c1398ab39fd.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] oeqa/runtime/cases: new image_upgrade test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Apr 2024 17:17:33 +0100
In-Reply-To: <CANNYZj_PD0+DEM1XT9uqETkUvz5fzO7cQEFwLxZk7p+ZCqYs_Q@mail.gmail.com>
References: <20240429152221.3405405-1-michael.opdenacker@bootlin.com>
	 <CANNYZj_PD0+DEM1XT9uqETkUvz5fzO7cQEFwLxZk7p+ZCqYs_Q@mail.gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 16:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198749

On Mon, 2024-04-29 at 17:55 +0200, Alexander Kanavin wrote:
> On Mon, 29 Apr 2024 at 17:22, <michael.opdenacker@bootlin.com> wrote:
> > +# Version string utilities copied from yocto-autobuilder-helper/script=
s/utils.py
> > +
> > +def get_string_from_version(version, milestone=3DNone, rc=3DNone):
> > +=C2=A0=C2=A0=C2=A0 """ Point releases finishing by 0 (e.g 4.0.0, 4.1.0=
) do no exists,
> > +=C2=A0=C2=A0=C2=A0 those are major releases
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 if len(version) =3D=3D 3 and version[-1] =3D=3D 0:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 version =3D version[:-1]
> > +
> > +=C2=A0=C2=A0=C2=A0 result =3D ".".join(list(map(str, version)))
> > +=C2=A0=C2=A0=C2=A0 if milestone:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result +=3D "_M" + str(mile=
stone)
> > +=C2=A0=C2=A0=C2=A0 if rc:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result +=3D ".rc" + str(rc)
> > +=C2=A0=C2=A0=C2=A0 return result
> > +
> > +def get_tag_from_version(version, milestone):
> > +=C2=A0=C2=A0=C2=A0 if not milestone:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "yocto-" + get_strin=
g_from_version(version, milestone)
> > +=C2=A0=C2=A0=C2=A0 return get_string_from_version(version, milestone)
> > +
> > +def get_version_from_string(raw_version):
> > +=C2=A0=C2=A0=C2=A0 """ Get version as list of int from raw_version.
> > +
> > +=C2=A0=C2=A0=C2=A0 Raw version _can_ be prefixed by "yocto-",
> > +=C2=A0=C2=A0=C2=A0 Raw version _can_ be suffixed by "_MX"
> > +=C2=A0=C2=A0=C2=A0 Raw version _can_ be suffixed by ".rcY"
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 version =3D None
> > +=C2=A0=C2=A0=C2=A0 milestone =3D None
> > +=C2=A0=C2=A0=C2=A0 rc =3D None
> > +=C2=A0=C2=A0=C2=A0 if raw_version[:6] =3D=3D "yocto-":
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_version =3D raw_version=
[6:]
> > +=C2=A0=C2=A0=C2=A0 raw_version =3D raw_version.split(".")
> > +=C2=A0=C2=A0=C2=A0 if raw_version[-1][:2] =3D=3D "rc":
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D int(raw_version[-1][=
-1])
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_version =3D raw_version=
[:-1]
> > +=C2=A0=C2=A0=C2=A0 if raw_version[-1][-3:-1] =3D=3D "_M":
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 milestone =3D int(raw_versi=
on[-1][-1])
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_version =3D raw_version=
[:-1] + [raw_version[-1][:-3]]
> > +=C2=A0=C2=A0=C2=A0 version =3D list(map(int, raw_version))
> > +=C2=A0=C2=A0=C2=A0 """ Point releases finishing by 0 (e.g 4.0.0, 4.1.0=
) do no exists,
> > +=C2=A0=C2=A0=C2=A0 those are major releases
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 if len(version) =3D=3D 3 and version[-1] =3D=3D 0:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 version =3D version[:-1]
> > +=C2=A0=C2=A0=C2=A0 return version, milestone, rc
>=20
> I understand that the above is merely a copy-paste, but these
> functions would really benefit from having comments that contain
> examples of input and output. I don't understand what they do.

They're coming from yocto-autobuilder-helper and there are even unit
tests for these functions there :/.


> > +def get_poky_latest_image_url(machine, machine_variant, image_file):
> > +
> > +=C2=A0=C2=A0=C2=A0 """Returns the URL of the latest generated image fo=
r the current branch"""
> > +
> > +=C2=A0=C2=A0=C2=A0 baseversion, milestone, _ =3D get_version_from_stri=
ng(subprocess.check_output(["git", "describe", "--abbrev=3D0"], cwd=3Dbasep=
ath).decode('utf-8').strip())
> > +=C2=A0=C2=A0=C2=A0 tag =3D get_tag_from_version(baseversion, milestone=
)
> > +=C2=A0=C2=A0=C2=A0 downloads_base =3D "https://downloads.yoctoproject.=
org/releases/yocto/"
> > +
> > +=C2=A0=C2=A0=C2=A0 if milestone is not None:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 downloads_base +=3D "milest=
ones/yocto-%s" % tag
> > +=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 downloads_base +=3D tag
> > +
> > +=C2=A0=C2=A0=C2=A0 if machine_variant =3D=3D "":
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subdir =3D machine
> > +=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subdir =3D "%s-%s" % (machi=
ne, machine_variant)
> > +
> > +=C2=A0=C2=A0=C2=A0 return "%s/machines/qemu/%s/%s" % (downloads_base, =
subdir, image_file)
>=20
> Same here.=C2=A0 A comment with example input and output would help a lot=
.
>=20
> > +class ImageIpkUpgrade(OESelftestTestCase):
> > +
> > +=C2=A0=C2=A0=C2=A0 def run_image_upgrade_test(self, image, image_path,=
 image_url, pkg, features):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary: Test that generate=
d packages can
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be used to upgrade an older=
 image version.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is done by generating =
an image but then replacing it
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by an older image available=
 at a specified location.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 We then run QEMU on the old=
 image and replace the original
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 original package feeds by o=
ur own.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'EXTRA_IMAGE_=
FEATURES +=3D "package-management"\n'
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'PACKAGE_CLAS=
SES =3D "package_%s"\n' % pkg
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'IMAGE_CLASSE=
S +=3D "testimage"\n'
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features +=3D 'TEST_SUITES=
=3D"%s_sysupgrade"\n' % pkg
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(features)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Need to build a full imag=
e to build the .json file needed by QEMU.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Therefore, it is not suff=
icient to run only "package_write_ipk" for the image.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.logger.info("Generatin=
g '%s' and package index for latest commit in this branch..." % image)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake(image)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('package-index')
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Download previously gener=
ated image
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_full_path =3D '%s/%s'=
 % (self.builddir, image_path)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.remove(image_full_path)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.logger.info("Downloadi=
ng image: %s..." % image_url)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D 'wget -O %s %s' % (=
image_full_path, image_url)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D runCmd(cmd)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(0, result.=
status, cmd + ' returned a non 0 status: %s' % result.output)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Now run the upgrade tests=
 on the old image
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.logger.info("Running u=
pgrade tests on the downloaded image, using the package feeds generated her=
e...")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake(image + ' -c testim=
age')
> > +
> > +=C2=A0=C2=A0=C2=A0 def run_poky_image_upgrade_test(self, distro_varian=
t, image, machine_variant, fstype, pkg):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine =3D get_bb_var("MAC=
HINE")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D 'DISTRO =3D "p=
oky%s"\n' % distro_variant
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_file =3D '%s-%s.rootf=
s.%s' % (image, machine, fstype)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_path =3D 'tmp/deploy/=
images/%s/%s' % (machine, image_file)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_url =3D get_poky_late=
st_image_url(machine, machine_variant, image_file)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.run_image_upgrade_test=
(image, image_path, image_url, pkg, features)
> > +
> > +=C2=A0=C2=A0=C2=A0 @skipIfNotQemu()
> > +=C2=A0=C2=A0=C2=A0 def test_poky_altcfg_core_image_ext4_full_cmdline_i=
pk_upgrade(self):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.run_poky_image_upgrade=
_test("-altcfg", "core-image-full-cmdline", "alt", "ext4", "ipk")
>=20
> This is a much improved code structure that can scale easily, right? :)

Its getting better but the last bit of this=20
(run_poky_image_upgrade_test and
test_poky_altcfg_core_image_ext4_full_cmdline_ipk_upgrade) should be in
meta-yocto/meta-poky/lib/oeqa/selftest.

Cheers,

Richard





