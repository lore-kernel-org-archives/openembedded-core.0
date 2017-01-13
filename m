Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C212271D45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:52:38 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j13so44856615iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=d/IWSvYTGkwfYAr+qmlVbaWkSh+0VyD6B4HgMD6xRbY=;
	b=LtvKjcEwjMLtFwn1muqEl5YQYzpdv6jaxR3odLTgTwC2no4w4nOlcIH2P6SmEuoStp
	bJaGR6ewQd7Q2PpTuZVJmPjetkmzIXtzGu+2Lq/sYNIXcnEaf6nNtTPj+Oad9Ydu97G4
	Kt5WXSChLHng7d4a84PnbHcgJoOS8J7H57OJkD4WQEZFfzjjb2VfYz58uRA90GhGaUgh
	AExe+Af1ujakd/NFJj2nz7f11ibYyo0pe8FFawWMKEq5ON2P3LVJfmdcUSzpKUxGXwF9
	8khrJWzFFxHvacdigD4P+ef02GoCioZGuFPvOWESv0A6VBT3ENI+5AAU9c6svKXmK6MS
	lTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d/IWSvYTGkwfYAr+qmlVbaWkSh+0VyD6B4HgMD6xRbY=;
	b=ik6UysELaBpSD7b6QT2ubGQsWdPazGNhrJJQBvUqXZhzMx2Iv8QnIQqfTZsm5nfVdt
	5A3rZvZql9UgKZfnBewSZPIEGVFlBymK8UbRGaRPQDHV2uQGnJcoKMiM7OashwCdxzzV
	7CWs8eGI8FD2RPKacimHmAPYKjId9IuzNoEyVuhFzCgujJJxtFMfwm3l6HOxkR6DOf9q
	V/1EiDhc/WeGSbkE21rWX5v1uynmVj1dwS//xlFE3aQ0xiK3jf8y0iy8noGbuAoXeHIF
	MfphwTbrPcbxIVCerA2mpv6Efxs61fNbauM7FEaeE+XH+izW4a3SFcYcmQubWM8VNrVO
	d4HA==
X-Gm-Message-State: AIkVDXK3SHn6YfRaWaw5cngPnkwUrOl1WRwIwpvI3eHHbmM/lu2EQqIft0dfkAt4XvCsidHH
X-Received: by 10.107.149.18 with SMTP id x18mr17937919iod.167.1484319158819; 
	Fri, 13 Jan 2017 06:52:38 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56056.dip0.t-ipconnect.de.
	[87.165.96.86]) by smtp.gmail.com with ESMTPSA id
	o138sm989394itc.18.2017.01.13.06.52.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:52:37 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:52:30 +0100
Message-Id: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/3] rm_work enhancements
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
X-List-Received-Date: Fri, 13 Jan 2017 14:52:38 -0000

This is the OE-core side of the rm_work.bbclass enhancements. Depends
on the corresponding bitbake patch series. See the OE-core "rm_work +
pybootchart enhancements" mail thread for further information.

Changes since v1:
  - now based on the (tenative!) bb.event.RecipeTaskPreProcess instead
    of prioritized anonymous functions
  - no need to change the scheduler, the "completion" scheduler now
    has the enhanced implementation

Patrick Ohly (3):
  gcc-source.inc: cleanly disable do_rm_work
  rm_work_and_downloads.bbclass: more aggressively minimize disk usage
  rm_work.bbclass: clean up sooner

 meta/classes/rm_work.bbclass               | 31 ++++++++++++++--------
 meta/classes/rm_work_and_downloads.bbclass | 33 +++++++++++++++++++++++-
 meta/recipes-devtools/gcc/gcc-source.inc   |  2 +-
 3 files changed, 54 insertions(+), 12 deletions(-)
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass

base-commit: acce512a0b85853b5acf2ef07e4163a3b4f33a98
-- 
git-series 0.9.1

