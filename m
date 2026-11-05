Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30719.1793872574561069242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1Ysv9BYo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1766E1A0830
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 09:56:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B81AB5FF85;
	Thu,  5 Nov 2026 09:56:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25CC110328E77;
	Thu,  5 Nov 2026 10:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793872571; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iRpgiIS5VD0S4rOfoLkYJQxjoSyp9bK3XnHhQi3654U=;
	b=1Ysv9BYoOmaOqg7WnWdpBCGiZYtRKOWB6mIh2x6hMZTWQPM6CPjBZEkwVsNsLUqF/X+PAU
	PufXwCTFOVXmlUKzIqkbzPBw0daCZ/uHqUe4Lkg2D5UN7oZ7xJUPaahAFqloJHPAilcCAk
	7/rswmwNx7IHNFRYbgbiNEkOcWdRAhpFS8CyNa/Ea9Ojz5di6QNYZgr4UsvV3mF7aBTZru
	ObiL/ieaMTLJsWFmX9R4Op8tpSSfv+EeyZKvDD26Nro6+RMSHXVSRGIkNlt0j9oroperCA
	2IzRsLjC4dDi9DgPjW6exzbfgWScTp5Tf8JQSAfNFCAnKbSIqphnh/upmPU5wA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 10:56:09 +0100
Message-Id: <DMN6R5OD6K0L.KNE00WT6X3LP@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v8 0/9] Implement SPDX for deploy tasks
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249523

On Wed Nov 4, 2026 at 4:33 PM CET, Joshua Watt via openembedded-core wrote:
> The SPDX use case for file system image has been well defined since SPDX
> was first implemented, however there has always been a desire to also
> express SPDX output for other non-image deliverables (primarily, those
> that have a do_deploy task or similar). These types of tasks cannot
> easily use the traditional method of having a separate SPDX task that
> runs to create their SPDX output as this causes lots of problems with
> the way dependencies are specified. Instead, it is desirable for these
> tasks to directly produce SPDX output that can be consumed by other
> tasks that depend on them.
>
> This patch series adds support for this. Any sstate task that starts
> with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> will run a postfunc to generate SPDX output that describes what is being
> deployed. For classical do_deploy tasks, this is setup to be easy by
> automatically capturing all the deployed output files in the SPDX data,
> but other tasks can be added as well.
>
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
>

Hi Joshua,

Sorry, it looks like one of the selftests is still failing:

2026-11-04 20:54:56,255 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_allarch_samesigs (subunit.RemotedTestCase)
2026-11-04 20:54:56,256 - oe-selftest - INFO -  ... FAIL
...
2026-11-04 20:54:56,257 - oe-selftest - INFO - 14: 40/74 566/796 (126.20s) =
(0 failed) (sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs)
2026-11-04 20:54:56,257 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 474, in test_=
sstate_allarch_samesigs
    self.sstate_common_samesigs(configA, configB, allarch=3DTrue)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 207, in sstat=
e_common_samesigs
    self.assertEqual(files1, files2)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1206, in assertDictEqua=
l
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: {'nat[270260 chars]do_package_qa': '857626b7bdd74c4b2507f08=
5ec1d3[30298 chars]ccf'} !=3D {'nat[270260 chars]do_patch': '58d5b3102c4ba7=
a2388712a2a7f962d88e[30298 chars]ccf'}
  {'adwaita-icon-theme/do_compile': '5390f85c42205bb5a14f7d92537a8420867861=
c0ef9adc409863aa1a1cd61709',
   'adwaita-icon-theme/do_configure': 'a280235b7d74824b3743f9490b3549add607=
d66c38976212ef67a5598819592e',
   'adwaita-icon-theme/do_create_package_spdx': 'e62d8265977d1a7e3ad698899b=
e0f643a79e7a5a7b7b6f10292c8959a58fc267',
   'adwaita-icon-theme/do_create_recipe_spdx': 'efe776c196e9c591367785ce9a3=
2d02228af827c2995ce26df1885b88065da9d',
   'adwaita-icon-theme/do_create_spdx': 'bde607fa1590084bb0b587b76f48bec54b=
0ecff13a4a437385558eeb7a5595dd',
   'adwaita-icon-theme/do_deploy_source_date_epoch': '8de41ddc1f7abb948c161=
ec6591dbe887186eafe18890b24a13568793ab8e897',
   'adwaita-icon-theme/do_fetch': '21febaeb8a75763a5eed0a68a22d15a4cb491f25=
c5d59a086c5d3a48c6ac7176',
   'adwaita-icon-theme/do_install': '7d74cc9d42787eb59d2185a92d974e5a61d7cb=
8e60a23319fdb947cb42389739',
   'adwaita-icon-theme/do_package': '435d8e3412602a492d7b016d3b8615f78fc4de=
88113bd8180ed8e2c420a55ca2',
   'adwaita-icon-theme/do_package_qa': '497742679e6ab012cb1050d1f6358737f31=
2fe0520b3ab55a8329924af0b42a8',
   'adwaita-icon-theme/do_package_write_rpm': '7d5c34df18018681012fc3544d90=
fa227d311c18c0093459cf9082c9cddb9e6c',
   'adwaita-icon-theme/do_packagedata': 'eb4f146bb2fed70fb92c69bf02d1e44784=
29b02ea6a9354442cb1af3a34edd2b',
   'adwaita-icon-theme/do_patch': 'ee2331e00fd0a461aece4ec16f69cecb8463aac4=
b5a01e07858a515b85c39c53',
   'adwaita-icon-theme/do_populate_lic': 'e41b536e4515805e401b974e48c25168b=
7e95d523f38806bf101aa4b923d3dfc',
   'adwaita-icon-theme/do_populate_sysroot': 'b5ff360309b0769e840d56103b803=
6fa882da881d7bfcd0fc89d93a0e460b5d8',
   'adwaita-icon-theme/do_prepare_recipe_sysroot': 'd82174494f146d0936439e3=
c5bb1a3d85759fe369008ad968017194f4b03733e',
   'adwaita-icon-theme/do_recipe_qa': 'b63675adc7d32dfccfe8a0a8b3be5a5aa892=
fcfb7a09288714502274ca318d0f',
   'adwaita-icon-theme/do_unpack': '04087c36f3690f91199bbe4e6a61a01bbf32550=
f289cdccdbc382227566aa54e',
   'adwaita-icon-theme/do_write_config': '3a0d46da99ab5c777732a0143eaedf231=
9bc385163d544a538ab918bc10ef664',
   'alsa-topology-conf/do_compile': '310c99f93ad20956d61fff0b5a8a18d8b84a17=
5c415110986f4a439023dba11b',
   ...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5193
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/5006
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5221

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

