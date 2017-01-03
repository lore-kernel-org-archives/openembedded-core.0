Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98CC96022E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 13:43:28 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id d16so30190117lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 05:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O3WBG6Ix5qm90wdsJauWvt312tT+o0nic9NzKZiu6fI=;
	b=Pzfb6S2ctL27zusYf3BmVhExqpeNPZPt+6uLnlTi8JivKi4/o5YtSmi/dHIwJfJuyp
	hoTNYUTL47IQd6P+I6x51U7nH5GhOKYpSNm5rDnAHLlRedg8pEa8vDEerxgaf75wj3cV
	F40mQl7d7u8F8q46ELAMmAjHBuz2uOQQa0fUTUk6yE/oYt6NLi/qahbanY93i1gWZlA+
	oRIVDhUO0ghmEdIl5glnl0dTnNC9EMdK47yyWh3b0Zt5bh2dEnPsnZjT3DVM8cubOo4U
	ONoBl/kpMBjFXUH4Sl5/tU8euvQU0rWid+1gDsFhA4t4Tu42eBXNgJv/ugZRp94paVJr
	j7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O3WBG6Ix5qm90wdsJauWvt312tT+o0nic9NzKZiu6fI=;
	b=ljGS1PDuSbgD4UNzT7X0LpqUMaUBTAx4t3z/zdGB5NmD20M1JhopBvz5fzBNsPLuRr
	YVM9WmC+7MABp0Iy7ghdxMS2T44WOTefiedvp39uNKb//a7iW2tPTni5vHVpjvtuTtIF
	AurPGOwaziDb1VSE/MHuIBUU+HEDPASz6pnt+pp9lxdo5AQ3rNSMuOeIh3vUj1iXikGH
	XFlwWfQxWYnMaxuuDXilF4ieNr2Gj6xl+43Ol6YOrhGpfcTj3aehppyjSmoaGmInxcZc
	yt2JWPodAWjAy3yuceK6laQUQ6zfyvt9q7MXIE9OzsgJh6LfzI0xXgJFJYn/3ET7avTp
	0D1Q==
X-Gm-Message-State: AIkVDXLUKUs2ewomnwaOrdySde1CiL/8Jp5HAMlDFX1CFfLLn2G0/SHWVq+1L3+5InYMsQ==
X-Received: by 10.25.158.143 with SMTP id h137mr622336lfe.142.1483451008349;
	Tue, 03 Jan 2017 05:43:28 -0800 (PST)
Received: from thinny.lan (81-230-13-64-no94.tbcn.telia.com. [81.230.13.64])
	by smtp.gmail.com with ESMTPSA id
	u203sm16802712lff.9.2017.01.03.05.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jan 2017 05:43:26 -0800 (PST)
From: ola.redell@gmail.com
X-Google-Original-From: ola.redell@retotech.se
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 14:42:55 +0100
Message-Id: <1483450976-22741-1-git-send-email-ola.redell@retotech.se>
X-Mailer: git-send-email 1.9.1
Subject: Kernel module package naming
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
X-List-Received-Date: Tue, 03 Jan 2017 13:43:30 -0000

From: Ola Redell <ola.redell@retotech.se>

Hi,

I have been working on a problem with safe kernel and kernel-module upgrade 
on a system using .deb packages and apt-get as package manager.

My problem has been that I need to be able to fall back to an earlier kernel
if a newly installed kernel fails to boot for some reason. The basic support
for this is handled in U-boot, but my problem has been with the upgrade of kernel
modules. Today, the same kernel module for different kernel versions has the
same name for both kernels and differ only in its package version. This
makes package managers remove the old kernel module when the newer one is
installed. As a result a safe fall back to the older kernel, whith its (old) 
modules is very difficult.

I have a solution that works for me by changing the kernel-module-split.bbclass 
to add the KERNEL_VERSION string to the kernel module package name. I assume 
this could be useful also in the general case. I am not a package management 
expert though, so let me know what you think.

/Ola

Ola Redell (1):
  Append KERNEL_VERSION string to kernel module package names

 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


