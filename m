Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8852674579
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 11:16:04 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id 13-v6so74020753ois.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aeGcQ/s3WCwbDjvuk1BcUNHzMxPdkwVohHENLzV+qes=;
	b=qs7m+HLjR3ZqySR3XbT1TNISB7HlKuvLwEbvP/ll8oq7t3Viq6aR/ILuDSic3YkWDW
	1vAkNbtbYB6Hq7viF54XiCGV9i6Cf2JN1qhtX++U+jTEhgU+Y6gR8SU9OYAmllaV04EA
	Erjm+umpq7ALbQD37T47YdVFyFr2UyJ9VwkJpFOA6VzNYaRru9XPAvMx3jjBStmmXXuR
	aSWF89qmzEX694yHRk3l8XF4/yqymoh9SqBF18RnUhNhaW3K8n7UGAKbapydgb0kb93c
	ilCJKKrxCqL9atbasAEgyl1YRm+zIG4qLhh/PMKydsMqOlvVmJJ1QZKPF0uW0gzcpCLA
	vyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aeGcQ/s3WCwbDjvuk1BcUNHzMxPdkwVohHENLzV+qes=;
	b=kA2K/9/QkotO/+EYaheD23Mjcao5KMI6dzuoHgSa5qWOoazRs0gieD9Z7ndqomJeDZ
	TuuZWTOR7P6QjJ/Tcm9VcLl0SmvjDiIXng+8KFdVAPXYdVztbY8o9aD9jX4tv5otj8xf
	S9hluDMrI6gnkm1J8D3XJha454+jePp9gvhqWJMTk105jCJuB/zkwFBqKxx0ODWPWToL
	LulV3WWNJaDvIV0krUB39niIfR6pcB/izkjxyL0/UbYRjcsk4bWn+YpRzkUofPXEYGlk
	UA1QwazE9sTmSJC5/zBnd3NH/E98wvqJ3yuy48wIsFPpRMA3JhWz1E2HRZzSYGDtetcq
	75JQ==
X-Gm-Message-State: AOUpUlHbs6NuWJQd6SIFDyhSuryI9ncb8HFxUGlTXtUMmy1ByophVnL+
	29B2roMSxsI88FRixFTGbbgfMEVLkK3Ec8YnzSP1RA==
X-Google-Smtp-Source: AAOMgpclJghCpswRNyKleqcpPtkSnsdhK8coo8yq1OpOXGYNjEB+GRfFXFm60nRs1e6dhsXsFpUgQ4l/r8uep8BoXcQ=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr18010217oib.320.1531739765582; 
	Mon, 16 Jul 2018 04:16:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 04:15:45
	-0700 (PDT)
In-Reply-To: <e6af6b2eb01b9352c712b960445cec300ac5aaf7.1531711090.git.Qi.Chen@windriver.com>
References: <cover.1531711090.git.Qi.Chen@windriver.com>
	<e6af6b2eb01b9352c712b960445cec300ac5aaf7.1531711090.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jul 2018 12:15:45 +0100
Message-ID: <CAJTo0LaiXVFq8jXwpbes1cP=-OWrw0NDWDWCVK0iN_=zprbX_w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oeqa/runtime/cases/rpm.py: workaround race condition
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
X-List-Received-Date: Mon, 16 Jul 2018 11:16:04 -0000
Content-Type: text/plain; charset="UTF-8"

Still refusing to accept a "sleep 1" on a race:

1) a 1 second sleep just makes the race rarer, a loaded host and
you'll hit it again and want to push it to 2 seconds
2) Upstream fix at
https://github.com/systemd/systemd/commit/86d18f3b09ec984ef3732567af992adb2dc77a8a

Ross

On 16 July 2018 at 04:20, Chen Qi <Qi.Chen@windriver.com> wrote:
> With the recent change in new systemd version, it's possible that
> a user is deleted before stopping user-runtime-dir@xxx.service.
> See link below.
>
>   https://github.com/systemd/systemd/issues/9541
>
> Workaround this issue by delay for 1 second before deleting user.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/rpm.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
> index 1e5e463..2f9dcad 100644
> --- a/meta/lib/oeqa/runtime/cases/rpm.py
> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
> @@ -87,6 +87,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
>              self.assertEqual(status, 0, msg=msg)
>
>          def unset_up_test_user(u):
> +            # Due to recent change in systemd, we need to sleep for a while
> +            # to avoid unexpected failure of user-runtime-dir@1000.service
> +            # See https://github.com/systemd/systemd/issues/9541
> +            if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
> +                self.target.run('sleep 1')
> +
>              status, output = self.target.run('userdel -r %s' % u)
>              msg = 'Failed to erase user: %s' % output
>              self.assertTrue(status == 0, msg=msg)
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

