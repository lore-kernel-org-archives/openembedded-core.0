Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE151C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:34:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8133.1708500852413317916
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 23:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GF6EB9w2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41275971886so2365495e9.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 23:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708500850; x=1709105650; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0VxCc18Kh7BLIdMFJkJeZynOfbxHJ/U0gDjtZTbs0IE=;
        b=GF6EB9w2vm+MrCa+mBFsgxANolczgJYis+TGyrIHEIwmEnEnCo7e1cTc/zSLyZyxSw
         G8V97Axq6nJdDaht3AasPjWPwPMeETVsRchBiqhGi6yfRWmpV94DSTFDfTjk/lzlDJXP
         7X2L7p5MyVzM4ncwAPvnwO/RG2w+HG1Q3RbcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500850; x=1709105650;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VxCc18Kh7BLIdMFJkJeZynOfbxHJ/U0gDjtZTbs0IE=;
        b=ii5Ndr4JCpDD0DyzX0BI6GXlgoKsDWIWdMDbKvo48EZjZaywpIsaeonk4TH51t6LFH
         zBktwGTPmRXR2LKSitliYVa59+HhpH0EMBsboOYanz+eGdJU9NoiETVv3Gz+Pux5BsMb
         yTN5sYYCMjSUPw7VDjv/YgSnTy628EZGlAPyc5bfa2LbFPKhr1Vr2TlyY9a5AXsvnWUu
         DHmjgl67SMoW1wPPLpQpSwjrm6q3EdqVZ5AJyt6+MmmcvCvoxrEoyJ3+dERMRXuXl/8f
         OqMgS6KqO9FXzPQvcjkK8kZjLQZZAYablZD9aSHTsTCHqopuBJQruTZHeCaNmPUcF7Eu
         VDjA==
X-Forwarded-Encrypted: i=1; AJvYcCUpaQsDL60VhaQSfz5XKK8UztTKq4YsVcvuGAH0ZlCs1oRHN/FkvvJaR/PVHYe6nd1i/QptBDbecfavzHcdifsGFRhxzxS0sS7XZkiFuMIetq0HzbZkgPpO
X-Gm-Message-State: AOJu0YzOJZrc75ql0YvoYRl8mvPNd+LMN1QZ4jefjMtslq8YGEexo6La
	ZHy7RIOCuwb2pVyHqVRcKEdk2GWqXvrqh+ZADvibYTZcNelWoCATu8O7lrExkfQ=
X-Google-Smtp-Source: AGHT+IGEB/bKjEiunzW97/h82vBTfVHCkkQa7hwJ4SVQr3L9Eot6mjWDTZFOWB9mF7bf9GYSAfuK0Q==
X-Received: by 2002:a05:600c:a42:b0:411:50aa:110d with SMTP id c2-20020a05600c0a4200b0041150aa110dmr13593617wmq.21.1708500850637;
        Tue, 20 Feb 2024 23:34:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f7eb:cc84:5778:9052? ([2001:8b0:aba:5f3c:f7eb:cc84:5778:9052])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c025a00b0041273fc463csm1505084wmj.17.2024.02.20.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:34:10 -0800 (PST)
Message-ID: <a57a3202b513da93b8b3a9571de922787a455328.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 1/4] testimage: create a list of failed test
 post actions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Wed, 21 Feb 2024 07:34:09 +0000
In-Reply-To: <20240220200159.13419-2-alexis.lothore@bootlin.com>
References: <20240220200159.13419-1-alexis.lothore@bootlin.com>
	 <20240220200159.13419-2-alexis.lothore@bootlin.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 07:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195959

On Tue, 2024-02-20 at 21:01 +0100, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> testimage is able to detect whenever a test run leads to some tests
> failing, and execute some actions in this case. The only action
> currently
> defined in such case is to retrieve artifacts from the target under
> test,
> as listed in TESTIMAGE_FAILED_QA_ARTIFACTS
>=20
> In order to be able to add multiple actions, define a central
> function to
> gather all "post actions" to run whenever a test has failed
> (run_failed_tests_post_actions). This function contains a table
> listing all
> functions to be called whenever a test fails. Any function in this
> table
> will be provided with bitbake internal data dictionary ("d") and the
> current runtime testing context ("tc"). Isolate all this feature in a
> dedicated bbclass file inherited by testimage.
> This patch does not bring any functional change.
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
> =C2=A0.../failed-tests-post-actions.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 64
> +++++++++++++++++++
> =C2=A0meta/classes-recipe/testimage.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 42 +-----------
> =C2=A02 files changed, 66 insertions(+), 40 deletions(-)
> =C2=A0create mode 100644 meta/classes-recipe/failed-tests-post-
> actions.bbclass
>=20
> diff --git a/meta/classes-recipe/failed-tests-post-actions.bbclass
> b/meta/classes-recipe/failed-tests-post-actions.bbclass
> new file mode 100644
> index 000000000000..7c7d3391298f
> --- /dev/null
> +++ b/meta/classes-recipe/failed-tests-post-actions.bbclass
> @@ -0,0 +1,64 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +
> +##################################################################
> +# Artifacts retrieval
> +##################################################################
> +
> +def get_artifacts_list(target, raw_list):
> +=C2=A0=C2=A0=C2=A0 result =3D []
> +=C2=A0=C2=A0=C2=A0 # Passed list may contains patterns in paths, expand =
them
> directly on target
> +=C2=A0=C2=A0=C2=A0 for raw_path in raw_list.split():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D f"for p in {raw_path}=
; do if [ -e $p ]; then echo $p;
> fi; done"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statu=
s, output =3D target.run(cmd)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if st=
atus !=3D 0 or not output:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 raise Exception()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resul=
t +=3D output.split()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.no=
te(f"No file/directory matching path {raw_path}")
> +
> +=C2=A0=C2=A0=C2=A0 return result
> +
> +def retrieve_test_artifacts(target, artifacts_list, target_dir):
> +=C2=A0=C2=A0=C2=A0 import shutil
> +
> +=C2=A0=C2=A0=C2=A0 local_artifacts_dir =3D os.path.join(target_dir, "art=
ifacts")
> +=C2=A0=C2=A0=C2=A0 if os.path.isdir(local_artifacts_dir):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shutil.rmtree(local_artifacts=
_dir)
> +
> +=C2=A0=C2=A0=C2=A0 os.makedirs(local_artifacts_dir)
> +=C2=A0=C2=A0=C2=A0 for artifact_path in artifacts_list:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.isabs(artifact=
_path):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn(f"{artifact_path} is not an absolute path")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest_=
dir =3D os.path.join(local_artifacts_dir,
> os.path.dirname(artifact_path[1:]))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.ma=
kedirs(dest_dir, exist_ok=3DTrue)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 targe=
t.copyFrom(artifact_path, dest_dir)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn(f"Can not retrieve {artifact_path} from test
> target: {e}")
> +
> +def list_and_fetch_failed_tests_artifacts(d, tc):
> +=C2=A0=C2=A0=C2=A0 artifacts_list =3D get_artifacts_list(tc.target,
> d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
> +=C2=A0=C2=A0=C2=A0 if not artifacts_list:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn("Could not load artif=
acts list, skip artifacts
> retrieval")
> +=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retrieve_test_artifacts(tc.ta=
rget, artifacts_list,
> get_testimage_json_result_dir(d))
> +
> +
> +##################################################################
> +# General post actions runner
> +##################################################################
> +
> +def run_failed_tests_post_actions(d, tc):
> +=C2=A0=C2=A0=C2=A0 post_actions=3D[
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_and_fetch_failed_tests_a=
rtifacts
> +=C2=A0=C2=A0=C2=A0 ]
> +
> +=C2=A0=C2=A0=C2=A0 for action in post_actions:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 action(d, tc)

Rather than create a bbclass class of python functions, these should
move to lib/oe and become a proper python library file?

Moving functions out of the class files is on my long term todo list so
this seems like an idea opportunity.

Cheers,

Richard

