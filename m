Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5244861A0C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 16:17:31 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z15so5914613wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=ttxUrhJ0aJafsRIit60K09tP5CefQvT09OnTrt+943M=;
	b=b851scD4Z1u5dKfN/BuBwVlldhk/8KfLtzfDkoGY1eP4PtSP1grRdiQdmzyA877LsF
	bGUdCbLYlbwIXFWG1v8qyyNv1CdR6Z7ZPGYY8jLilCweOekce6Q+cuOZO89ANBKYE0oc
	d03bKytSNDKWO3vHtBTyYCOga83cOvR4PDinc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=ttxUrhJ0aJafsRIit60K09tP5CefQvT09OnTrt+943M=;
	b=XF0RWo3qrHpmOdV9I2XP3UJZWIX4GmpkRimQCjAxQmNVBIHB6qX6XVatc8BTERjZXW
	GpCzF9pUYW/7p6OZl8IL2uITlr0VohCMzWk+LJ1LReEdlBAget8ZXRSC7n2wwnOweIub
	fII3+VwKhUpT1+HHaUbeR8d6IgruIZUI/R1dQ+hAixnPgbP3e3mR7EvSxTB/8xlHkf32
	Cu0kBq3DIfEWaaxXnhpXu5WKqjUiU8y42phtyaYt+ntZ5RbPxetaX6XSB+fxnKEdfzyr
	tM8qUziB0i59OzdgqBcyeD1daAQ6rCR86BblFiJXnnW0gs+ETOK2H5XRDAKf2xO/9tvR
	eTrQ==
X-Gm-Message-State: ANhLgQ038uTTLPFuYUs1fTqxzw37N5pY/h6OLBc0ebY5DOb8J8Sthcae
	Jna8Shbtqrq4A9awSsEt9dbbow==
X-Google-Smtp-Source: ADFU+vtdG1OJvVbAMv1+274eG2MJtMP+E1aN6OoA5qZIR45BF+Vom3WlP7FhEnS2ksPhNe3fqGvjYA==
X-Received: by 2002:adf:f544:: with SMTP id j4mr3839487wrp.183.1583597852166; 
	Sat, 07 Mar 2020 08:17:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j5sm18220155wmi.33.2020.03.07.08.17.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 08:17:31 -0800 (PST)
Message-ID: <f4e3d6a5a638b669dc742fddb14d652f06715d04.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sat, 07 Mar 2020 16:17:28 +0000
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: buildtools-extended-tarball wrapping builds
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
X-List-Received-Date: Sat, 07 Mar 2020 16:17:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I just wanted to mention that we now have the ability to wrap builds on
specific workers with specific buildtools tarballs.

Currently this functionality is in master, we do have the option of
porting the helper code to other stable branches.

We have had multiple issues, with the infrastucture internal url/cert
handling, git/cert environment issues, an issue with eSDK testing (next
has a fix in testing), the crypt fix already submitted (meaning M2's
tarball doesn't help)  and so on, I'm hoping we've gotten to the bottom
of those.

This does mean we could drop gcc 4.8/4.9 support if we wanted to and
rely on the tarball support for centos7/debian8. I'm torn on that, we
are still missing:

a) Support for wrapping a build with buildtools more auotmatically
(like we do with uninative)

b) documentation of buildtools-extended-tarball

and to drop, we'd probably need these pieces.

I'd note the people who vocally said they needed centos7 support are
not the ones who are doing this work. The only reason I'm pushing it is
I know it will ultimately help support our LTS efforts.

Cheers,

Richard



