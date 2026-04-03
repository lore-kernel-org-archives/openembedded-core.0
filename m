Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890A6E7E36B
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 10:32:18 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8821.1775212333213119292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 03:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Up9JKjRu;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d556c1a79eso2092343a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 03:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775212332; cv=none;
        d=google.com; s=arc-20240605;
        b=dvH6q+sx3U/oXYWAMsDvjAwsNEZQj6/p+4WrqNv3ow1OUXPTxMSKo3CZKt6pzqRy69
         jE6Hb2Km40Mne/7pOlBt9fdrmpyCqjXMWux9q7aACALpNJn+LfryM1kCG34gJzVgdeTa
         mn3oWc6+HP8qYlUndDpk6fqBYCTU/4sy+S+NxVHtpflHKMr6rnVN9fhPApiU6hhR1hya
         QqabBIQ9cX6cbTwQMlZW1dDEjMJjM1ucG40mqDvqN5gQr2Tzl+GZsOhD0VgM85diNkbv
         b9tuRimUaPBt2RmdRKPe1G4suOdwKJTBousv0Zkvam9MI7YJx6S84SVw3OXVK/dwvvSp
         H+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p9roA23XUbHPoXZD9VXI4ATqgWJKch9p06sHJ0LAgIA=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=EfqsKepakSYVJ8vTYsYprvjSW2rzmZ/5yaJV4d/WyUWNR2P+lVu10+wrxucHgAMyCZ
         K8voAdsqSAlvlfeU7DQG/AmknzEHTSfuqhvdxmzNNZ0O6imcHOUhGtpmW14GtfCERrhP
         oBniQZm9dXyCVJyjrLthvMG5xhK1gy27LwIdq+lBZxQvqZtSn/T8TxmP9knczNNTaSeX
         csEzYjjuijlHF4wVIxnMi/9NRtEY2//G64H9art9dEY2jUTBLBp8gmIezwesXkrVYlM9
         6pPU2mM+z7jtRh+DO1//MYDWlD+WqU3p8ceQeyJxNnpdDUOE831Vspk8+1RxYajxJv1t
         X5qg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775212332; x=1775817132; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p9roA23XUbHPoXZD9VXI4ATqgWJKch9p06sHJ0LAgIA=;
        b=Up9JKjRuyJRBrjygwK2UklGMm/pwEEB+U8nVacPNPQt9MheWczW9HVMtY9MAQaxcrd
         5JfhfGoxBm5QLR1SaXytoqM8P7aUkNWVUC+rPcGHzCivJARasxLkYZg855OXfAgnTaBU
         ghYRJL0d5orrD4bFq/Gq27hpld1Z1cqN1x7MS5sI+m6ooLcd2SiZY9v9YOUBXTjL8hr6
         RlgeDb3B1ku7jthSIgvJkq3kqtZC2fFbdfRdehaVIEAigPYxqgZZ082ZhMaqDmiLS5wg
         oQB6nPqogYMpD8/nipDxBgIlQgNSbQ3jLcebGklx7d/oEnugZpPEERYwWSDJLqhUftC1
         9Q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775212332; x=1775817132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9roA23XUbHPoXZD9VXI4ATqgWJKch9p06sHJ0LAgIA=;
        b=jzqOWu+7i/s5F0VyDh2i45Z+HT9g9QBAgy2vImJ9My4Ng1eM448/9f9Fn1nB0kNRk4
         /4nAKXBTjaZHbGIg+XloK1l+A7PbVy+yq49kWhQn0DYZQ85US3lgt7XFWdGZCqI5q2OS
         SlsGca4B7p+iSNjbC7vN2Z+9g8kfQVYTaGHp9fjhKeVPRDgaGdZ0t7xZD/U1EQMm/PYf
         BDqE6m+4Ezxyz3+seGE7o9zvVaE38Ou7W8WPqEkHYLNC6vM/Mg2iklMcPtKDhAs2cHUD
         R9HWXBOHUHqOCOe6tqQPww9gO0ROFlkmkTya/sOKVnsFWGN5v5K6yQTEXuFNtAftAAee
         G1kw==
X-Gm-Message-State: AOJu0YyPazWh7XEfUCnweCtuLWiROrDwzyU11WG5S2Du4ioLjPtuX0ON
	L+oemORyE/rRNeSMobWarlRXkTx/X/s6xD2w2B+Y1cfDr88UbxHaU3a5ME33Uy7vm+Nxs9URNyY
	DCPlJ6c1Uu6MV5EWRBP2n04AMlCQbfZ4=
X-Gm-Gg: ATEYQzxDs5OWrO+kROkNMLC2/ZcI21J6w2OYPWJUTARMmhQNUmsARUcyxWMreJwyMiy
	miKQYzk+X+fL9v9r52swlqvCbRGIisnk+jrWxv2jx/oG+LXTP14ODLN0E9dhYK+ZKcvnFaoVxpM
	AO7PwtcwlLGSoXaAc5A+jsM/hZO/ZuAwyi6adogQtYbJXA4Pu4Lt7HFwcdLsEkKlUDXs9N7qR9B
	9L96yWT8qGOvgcQheBtc+wyWr/QIAp/iGoT//YJF2LaBUMEcuLt4OWUS+JYepca+jiSeo+BB2c+
	N1dCW2ymsQ==
X-Received: by 2002:a05:6830:4411:b0:7d7:bf59:16df with SMTP id
 46e09a7af769-7dbb751779emr1484141a34.17.1775212332233; Fri, 03 Apr 2026
 03:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com> <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com>
In-Reply-To: <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 3 Apr 2026 12:32:01 +0200
X-Gm-Features: AQROBzD22-t1B7ju9UXxOD0Cp_URLT_klsNQuhatWxguqP4LeNv0FbSz-CkvICQ
Message-ID: <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000076b600064e8bd457"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 10:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234578

--00000000000076b600064e8bd457
Content-Type: text/plain; charset="UTF-8"

Hmmm, can't see any connection between those tests and this particular
patch...
The thing is, that since the patch fixes a call to an undefined function,
there could not have been a test covering this case in the first place ;-)
In addition, the function call takes place only in the 'bitbake -b' case...

Where can it be found, which other changes took place in those builds?

On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Thu Apr 2, 2026 at 5:39 PM CEST, Adam Blank via lists.openembedded.org
> wrote:
> > The function is named 'package_populate_pkgdata_dir' but the
> > call was to 'staging_package_populate_pkgdata_dir'.
> >
> > Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> > ---
>
> Hi Adam,
>
> Thanks for your patch.
>
> I can't say if this is another issue or something wrong with the tests,
> but two of these are failing because of this patch:
>
> 2026-04-02 19:56:53,924 - oe-selftest - INFO -
> sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
> (subunit.RemotedTestCase)
> 2026-04-02 19:56:53,926 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-04-02 19:56:53,926 - oe-selftest - INFO - 13: 17/52 271/679 (95.16s)
> (0 failed) (sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs)
> 2026-04-02 19:56:53,926 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py",
> line 469, in test_sstate_allarch_samesigs
>     self.sstate_common_samesigs(configA, configB, allarch=True)
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py",
> line 206, in sstate_common_samesigs
>     self.assertEqual(files1, files2)
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqual
>     assertion_func(first, second, msg=msg)
>     ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.13/unittest/case.py", line 1206, in
> assertDictEqual
>     self.fail(self._formatMessage(msg, standardMsg))
>     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
>     raise self.failureException(msg)
> AssertionError: {'nat[31 chars]ckage_qa':
> '1cf298a771718a59519250687e84c92de5[302150 chars]adb'} != {'nat[31
> chars]ckagedata': 'e9b33afd6d363736c82af96ef0a991046[302150 chars]bb4'}
>   {'adwaita-icon-theme/do_compile':
> '18aab6f6fe8018875194a0636a0f373a55f73fb4b8129d77a2e1d086d2ec578e',
>    'adwaita-icon-theme/do_configure':
> '7380b23df0d0ef5ef3abc408bf06c4b25284a707bbb39391092412c9e5fdd0f0',
> -  'adwaita-icon-theme/do_create_package_spdx':
> '71291be90a9aae925880a5fb43a06ac5e77b516d30297dc2a512939386160379',
> +  'adwaita-icon-theme/do_create_package_spdx':
> 'e79bbe627c2567a418bd672bef357e0e2561f24100be568749bd5e0618503328',
>    'adwaita-icon-theme/do_create_recipe_spdx':
> '4a4714266c3fb489eb4e563917ccccb38cc0b9f66594a6107f3a502036a3c5b3',
> -  'adwaita-icon-theme/do_create_spdx':
> 'd4a4708d298a5dd62e647fe7e886d5c673e9c3aac4365c743360dbcafb18be38',
> +  'adwaita-icon-theme/do_create_spdx':
> '98cd801f20f0ffb0e9bdffd12ee44f748e4d292e828f1cd37b7fdb1d24f195d6',
>    'adwaita-icon-theme/do_deploy_source_date_epoch':
> '9f88202fbc0193ad762daea7e7b614cbed0c61ff6a60a2dfba4bbd770e21f91f',
>    'adwaita-icon-theme/do_fetch':
> '2ddf4b31dca442e88c40cbadb087f7f14aa5e7903ddf25a9eaa010a784df31e0',
>    'adwaita-icon-theme/do_install':
> '997dd989d8d5379abaeaea11cb76db90603e4fd8e5b15eaa7d3bed5efc6c2f28',
> -  'adwaita-icon-theme/do_package':
> 'ae407bcb5d420c505b3de2dd5d67eb6c9d81b31da8008393c72bda7d1f7d4e3e',
> -  'adwaita-icon-theme/do_package_qa':
> '0f93d17760ba7d350147722bf7a49a88580f3d2d511acace784be8737ab28624',
> -  'adwaita-icon-theme/do_package_write_rpm':
> 'd672adc3f3a53d3392340974f4a7edc92bd455a6b5782a527a0f22f76ffc18d3',
> -  'adwaita-icon-theme/do_packagedata':
> '252ddb5c78401938a7e0cc11803932ec5d5c55083a7bdcdee4e23c1f992c0f2f',
> +  'adwaita-icon-theme/do_package':
> 'fcae5f450961cf5319679099fa4948312f289150a73b75f4e6271aa41eaf35f4',
> +  'adwaita-icon-theme/do_package_qa':
> '4d363ce538fd446486e157c8c4e7c304e8bb39fcddc70effc8779dee824984e8',
> +  'adwaita-icon-theme/do_package_write_rpm':
> 'b9b134d7912f00b50297f2d18d64ff3589054c48574655b5f6749d9517451651',
> +  'adwaita-icon-theme/do_packagedata':
> '25015261e21fd33d2c29b66af7158a8818612793eb676574355245c359bfbb99',
>    'adwaita-icon-theme/do_patch':
> 'fbb075a802b4418e22df82386efbb58dd9bcb6902a5a2599d7b57921ba142e29',
> ...
> 2026-04-02 19:59:11,956 - oe-selftest - INFO -
> sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib
> (subunit.RemotedTestCase)
> 2026-04-02 19:59:11,957 - oe-selftest - INFO -  ... FAIL
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3580
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3678
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3468
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000076b600064e8bd457
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hmmm, can&#39;t see any connection between those tests and th=
is particular patch...</div><div class=3D"gmail_default" style=3D"font-size=
:small">The thing is, that since the patch fixes a call to an undefined fun=
ction, there could not have been a test covering this case in the first pla=
ce ;-)</div><div class=3D"gmail_default" style=3D"font-size:small">In addit=
ion, the function call takes place only in the &#39;bitbake -b&#39; case...=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Where can it be found, w=
hich other changes took place in those builds?</div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand &lt;<a href=3D"mailto:mat=
hieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Apr=
 2, 2026 at 5:39 PM CEST, Adam Blank via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; The function is named &#39;package_populate_pkgdata_dir&#39; but the<b=
r>
&gt; call was to &#39;staging_package_populate_pkgdata_dir&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Adam Blank &lt;<a href=3D"mailto:adam.blank.g@gmail.com=
" target=3D"_blank">adam.blank.g@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Adam,<br>
<br>
Thanks for your patch.<br>
<br>
I can&#39;t say if this is another issue or something wrong with the tests,=
<br>
but two of these are failing because of this patch:<br>
<br>
2026-04-02 19:56:53,924 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_allarch_samesigs (subunit.RemotedTestCase)<br>
2026-04-02 19:56:53,926 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
2026-04-02 19:56:53,926 - oe-selftest - INFO - 13: 17/52 271/679 (95.16s) (=
0 failed) (sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs)<br=
>
2026-04-02 19:56:53,926 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py&quot;, lin=
e 469, in test_sstate_allarch_samesigs<br>
=C2=A0 =C2=A0 self.sstate_common_samesigs(configA, configB, allarch=3DTrue)=
<br>
=C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<b=
r>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py&quot;, lin=
e 206, in sstate_common_samesigs<br>
=C2=A0 =C2=A0 self.assertEqual(files1, files2)<br>
=C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 907, in =
assertEqual<br>
=C2=A0 =C2=A0 assertion_func(first, second, msg=3Dmsg)<br>
=C2=A0 =C2=A0 ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 1206, in=
 assertDictEqual<br>
=C2=A0 =C2=A0 self.fail(self._formatMessage(msg, standardMsg))<br>
=C2=A0 =C2=A0 ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 732, in =
fail<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: {&#39;nat[31 chars]ckage_qa&#39;: &#39;1cf298a771718a595192=
50687e84c92de5[302150 chars]adb&#39;} !=3D {&#39;nat[31 chars]ckagedata&#39=
;: &#39;e9b33afd6d363736c82af96ef0a991046[302150 chars]bb4&#39;}<br>
=C2=A0 {&#39;adwaita-icon-theme/do_compile&#39;: &#39;18aab6f6fe8018875194a=
0636a0f373a55f73fb4b8129d77a2e1d086d2ec578e&#39;,<br>
=C2=A0 =C2=A0&#39;adwaita-icon-theme/do_configure&#39;: &#39;7380b23df0d0ef=
5ef3abc408bf06c4b25284a707bbb39391092412c9e5fdd0f0&#39;,<br>
-=C2=A0 &#39;adwaita-icon-theme/do_create_package_spdx&#39;: &#39;71291be90=
a9aae925880a5fb43a06ac5e77b516d30297dc2a512939386160379&#39;,<br>
+=C2=A0 &#39;adwaita-icon-theme/do_create_package_spdx&#39;: &#39;e79bbe627=
c2567a418bd672bef357e0e2561f24100be568749bd5e0618503328&#39;,<br>
=C2=A0 =C2=A0&#39;adwaita-icon-theme/do_create_recipe_spdx&#39;: &#39;4a471=
4266c3fb489eb4e563917ccccb38cc0b9f66594a6107f3a502036a3c5b3&#39;,<br>
-=C2=A0 &#39;adwaita-icon-theme/do_create_spdx&#39;: &#39;d4a4708d298a5dd62=
e647fe7e886d5c673e9c3aac4365c743360dbcafb18be38&#39;,<br>
+=C2=A0 &#39;adwaita-icon-theme/do_create_spdx&#39;: &#39;98cd801f20f0ffb0e=
9bdffd12ee44f748e4d292e828f1cd37b7fdb1d24f195d6&#39;,<br>
=C2=A0 =C2=A0&#39;adwaita-icon-theme/do_deploy_source_date_epoch&#39;: &#39=
;9f88202fbc0193ad762daea7e7b614cbed0c61ff6a60a2dfba4bbd770e21f91f&#39;,<br>
=C2=A0 =C2=A0&#39;adwaita-icon-theme/do_fetch&#39;: &#39;2ddf4b31dca442e88c=
40cbadb087f7f14aa5e7903ddf25a9eaa010a784df31e0&#39;,<br>
=C2=A0 =C2=A0&#39;adwaita-icon-theme/do_install&#39;: &#39;997dd989d8d5379a=
baeaea11cb76db90603e4fd8e5b15eaa7d3bed5efc6c2f28&#39;,<br>
-=C2=A0 &#39;adwaita-icon-theme/do_package&#39;: &#39;ae407bcb5d420c505b3de=
2dd5d67eb6c9d81b31da8008393c72bda7d1f7d4e3e&#39;,<br>
-=C2=A0 &#39;adwaita-icon-theme/do_package_qa&#39;: &#39;0f93d17760ba7d3501=
47722bf7a49a88580f3d2d511acace784be8737ab28624&#39;,<br>
-=C2=A0 &#39;adwaita-icon-theme/do_package_write_rpm&#39;: &#39;d672adc3f3a=
53d3392340974f4a7edc92bd455a6b5782a527a0f22f76ffc18d3&#39;,<br>
-=C2=A0 &#39;adwaita-icon-theme/do_packagedata&#39;: &#39;252ddb5c78401938a=
7e0cc11803932ec5d5c55083a7bdcdee4e23c1f992c0f2f&#39;,<br>
+=C2=A0 &#39;adwaita-icon-theme/do_package&#39;: &#39;fcae5f450961cf5319679=
099fa4948312f289150a73b75f4e6271aa41eaf35f4&#39;,<br>
+=C2=A0 &#39;adwaita-icon-theme/do_package_qa&#39;: &#39;4d363ce538fd446486=
e157c8c4e7c304e8bb39fcddc70effc8779dee824984e8&#39;,<br>
+=C2=A0 &#39;adwaita-icon-theme/do_package_write_rpm&#39;: &#39;b9b134d7912=
f00b50297f2d18d64ff3589054c48574655b5f6749d9517451651&#39;,<br>
+=C2=A0 &#39;adwaita-icon-theme/do_packagedata&#39;: &#39;25015261e21fd33d2=
c29b66af7158a8818612793eb676574355245c359bfbb99&#39;,<br>
=C2=A0 =C2=A0&#39;adwaita-icon-theme/do_patch&#39;: &#39;fbb075a802b4418e22=
df82386efbb58dd9bcb6902a5a2599d7b57921ba142e29&#39;,<br>
...<br>
2026-04-02 19:59:11,956 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_nativesdk_samesigs_multilib (subunit.RemotedTestCase)<br>
2026-04-02 19:59:11,957 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3580" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/3580</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/3678" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/23/builds/3678</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/3468" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/3468</a><br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000076b600064e8bd457--

