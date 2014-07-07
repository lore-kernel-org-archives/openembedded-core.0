Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id EACE57038D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:40:28 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q108so3356481qgd.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 02:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uVvmCUziNrjWDryA1+TFhRmNKzkvGI1CYSdsbYdcs0w=;
	b=VkiKrbL0uS0HedjaNHnx8ny75EOCgWquBgklRMoHI8+FO2xzDUo3ReLYiMPzg+7Zzr
	SwGTtYtdmmoZO7oGYqN45+mAk8QuARe0Wn0mt+ArI+THHgJFS29vpEThBA3TN9/TrAjP
	QcsqYzUWm22MW31vB8yq1ro609LyCnds7TGh3L0wcMbGvy8nhJTYoq2uwA4Xn0+rt3YV
	3iwCZHpzkNAKjIW5/cafKRl9oMcRiV+LpVcOtyH8jPx/1Ox9uYE804cnS0DsysHIll+F
	D/zRR83bt88V+iy2GKBpy6dcH2OvKwdupsSjcWRrKXT6ub670aHqrEnW1pibjZ0POaof
	6vpw==
X-Gm-Message-State: ALoCoQmSYuTtF4HJYPA2rvamZbL7wYG8rBTG0b/m9SGAT2R6NNv3zoM3Lq4asnYAQUHNnpbZ5Rha
X-Received: by 10.224.25.206 with SMTP id a14mr34408364qac.35.1404726028831;
	Mon, 07 Jul 2014 02:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Mon, 7 Jul 2014 02:40:08 -0700 (PDT)
In-Reply-To: <1404540383-13425-1-git-send-email-ming.liu@windriver.com>
References: <1404540383-13425-1-git-send-email-ming.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jul 2014 10:40:08 +0100
Message-ID: <CAJTo0LbLcADdC0qC7cYNDWoZOjvj_BXg42-K4siPE518MykU2Q@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Mon, 07 Jul 2014 09:40:35 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2014 07:06, Ming Liu <ming.liu@windriver.com> wrote:
> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from
> install of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
> gconf-3.2.6-r0.0.x86_64

Your patch doesn't move the file that is conflicting so it won't help...

As you'll only ever install a single instance of the binaries, the
correct fix would be to split the ML-appropriate libraries into a
libgconf, but leave the DBus service and tools in the main package.
Then multilib images can install lib32gconf, lib64gconf, and gconf.

Ross

