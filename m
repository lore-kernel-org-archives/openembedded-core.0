Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id DB856718FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:53:19 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so6244259qcv.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D8YEPgu2e1YGgt8C35XfilDg2aa/5SMCiTyHMYeKBZA=;
	b=LQuEi+U+MhFPgpoWOk9OQcoQKNe0TsHul4pO2B53xEx9S1GNegkBcxMFWTEcGBtA6w
	sLQ7/OIBq9LlWs5aoeKHpJoYfVvT2pOJdigg6Vm3BNeYtnE4zt3J4ydlkqw9nrvCaTfM
	RcoalJUgkoFokGJmRNZPr/KmisvchXpR1z4XGb5IY7HSTcXdS6zyLoqNir03M6wsx6k/
	ie08nqPJPpLmMgFqBkr1+NRsg9rT8rlMwwUbi2H2xoMDdXPv0XHTNRIrvyfP3KwUCezh
	M9eo+Lt5VlZvAv/vq8HB/PK3WijupY1xA80HOHfbGUAaMR9qAwkBOsl8SWsmkTFOpneZ
	zTdw==
X-Gm-Message-State: ALoCoQmKOZByKRJKCOD7OSUt+1FxvhIjgEkT7n2m63yj6iq6GW8Ndnvo82UBeu/Q5OzDCHjDVS2/
X-Received: by 10.140.28.10 with SMTP id 10mr6317664qgy.15.1413280400128; Tue,
	14 Oct 2014 02:53:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Tue, 14 Oct 2014 02:52:59 -0700 (PDT)
In-Reply-To: <be59231ba5c4dfafcb4d8e9951e8d10414ed0c64.1413275947.git.Chong.Lu@windriver.com>
References: <cover.1413275947.git.Chong.Lu@windriver.com>
	<be59231ba5c4dfafcb4d8e9951e8d10414ed0c64.1413275947.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Oct 2014 10:52:59 +0100
Message-ID: <CAJTo0La_gxKvJ3TqiimF4C6tMNmCay7_=NSQSTqo8itTANCtPw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Tue, 14 Oct 2014 09:53:21 -0000
Content-Type: text/plain; charset=UTF-8

On 14 October 2014 09:39, Chong Lu <Chong.Lu@windriver.com> wrote:
> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
> in the sdk:
> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
> gconf-3.2.6-r0.0.x86_64
>
> Changed ${libexecdir} to /usr/libexec to fix this issue.

Haven't we been here before?  A better fix is to split the library and
the daemon into separate packages, so in a multilib environment you
have lib32gconf, lib64gconf, and gconfd (which can be 32- or 64-bit).

Ross

