Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B10171DCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:28:32 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id v23so21063811qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F5oXCMn5x0j7OmHWOt9Q5JLq6Rcr9dD9vjiPqMg37k8=;
	b=kZRq6tkLIRkSPulkQh/ciQQaGPT0ftXuy59vWLVqkt1s1ch1PJjlVbsMPwMD9bG8iC
	zqSgmb0wBsG9XfQ0WsyxL7Ek4cfCu+lS/Gikl+z1olZySczLFZwOBGG9wqRoYnveqlMR
	o0u7nNmG0EhHCoybD+CWi5CD0nBp6/cb6NOHMwV9TSeabgEdE9hd/ZRLJlRXK6VksTtI
	4ZNY8iyy2EltN2s+9qtfsD6JW6qnJAtIy/8lTs3p8FWBvsc3Lj6sFtZyqUaAn3gHhclz
	sgdfkx0ZkjYDyTWsDGJpNoQds9SWDAZsLgNyN0MSL2o5GW3sRwWX8GS5vzA2/QLZtnbo
	WCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F5oXCMn5x0j7OmHWOt9Q5JLq6Rcr9dD9vjiPqMg37k8=;
	b=V/LFl0VNXGeZbGdnRu8kNMUoIkdVrM79i/+jpl/agTdlbZJlUxrIQzBbQfwWnREC8b
	jQAICuMImikTIbiR8ftO+ueJk4ui+dGh7zBBiKixPFgw50zsVRkuIEkPBLzcA3s3Ymm+
	C+8rHZ0RD5+4sYAraHuesl1JoB7uvTOfX+Z4uWRQ9wa0RjVo91n318JXp+zEn2cmN6Ep
	pDaenc1UqnJvExkU70jaRNRwHcME9b6sA9Bnzt97rDZ6T6q1oK2ahe7MsNEEQwm+E0GE
	vw9ePI5s3PTAgU3YqTKtw7E6M8Y99mAuAekfByFsvcBbDE1EQjuT0o952e2JP85L4m8U
	PXEw==
X-Gm-Message-State: AIkVDXJBl0JAK+r7WgUHDB21Ziwxs9OJ6NhO0YI5jxbup7sV8/IhzLdM8TjUXQ1O77WgloDmvYxrE2iDZ8EEwE3m
X-Received: by 10.237.62.232 with SMTP id o37mr32844895qtf.188.1485354513210; 
	Wed, 25 Jan 2017 06:28:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 25 Jan 2017 06:28:12 -0800 (PST)
In-Reply-To: <1485302185-20648-1-git-send-email-jslater@windriver.com>
References: <1485302185-20648-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jan 2017 14:28:12 +0000
Message-ID: <CAJTo0LZoL=H3QjjzCkc8AQf08DpqakA=tQqR_zTFnzh9aBcWzA@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] gnutls: avoid accidentally using libseccomp
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
X-List-Received-Date: Wed, 25 Jan 2017 14:28:33 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e2039340546ec0c45

--001a11406f0e2039340546ec0c45
Content-Type: text/plain; charset=UTF-8

On 24 January 2017 at 23:56, Joe Slater <jslater@windriver.com> wrote:

> --- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> +++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> @@ -1,7 +1,7 @@
>  Certain syscall's are not availabe for arm-eabi, so we eliminate
>  reference to them.
>
> -Upstream-status: pending
> +Upstream-Status: Pending
>

Looks like you squashed the fix into the wrong patch...

Ross

--001a11406f0e2039340546ec0c45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 January 2017 at 23:56, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jslater@windriver.com" target=3D"_blank">jslater@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3iw" class=3D"=
a3s aXjCH m159d2e9551ce8799">--- a/meta/recipes-support/gnutls/<wbr>gnutls/=
arm_eabi.patch<br>
+++ b/meta/recipes-support/gnutls/<wbr>gnutls/arm_eabi.patch<br>
@@ -1,7 +1,7 @@<br>
=C2=A0Certain syscall&#39;s are not availabe for arm-eabi, so we eliminate<=
br>
=C2=A0reference to them.<br>
<br>
-Upstream-status: pending<br>
+Upstream-Status: Pending</div></blockquote></div><br>Looks like you squash=
ed the fix into the wrong patch...</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11406f0e2039340546ec0c45--
