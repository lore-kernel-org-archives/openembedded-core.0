Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 465DD781A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:21:58 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id 188so7053155pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DPVIeSYfWs/V7MFlg+nsYuEG+eMo4+Vy7Lys1OwEOK4=;
	b=b2FsctoKCQoG5vQ/nEt5o/7rwqzejO/dFiiS37sn39Kou6MKeuAcNXMdDBTG6BK+rM
	1AktHpdDid9Iw/np8C7IyoAUK0V8HxAzEAMLFvLi8RVjWORVTntXznqoGxNYSFw0Z3f2
	5wkzasxcicjT0W2lPk0+cwAcRWTJJrgF0wTNNiJoG4ynmETvuxWD36n/8faoWF6MLdUo
	XNndKQCzU/DHvFrBV7iSM+wSSjaX19pbtCchq/uw5vrp2nJyLdI35zsdbX0cgwIJpPW5
	l9KM/3QN3VXgOcBHCj28kym9PbvijT4Yev0q/ym/jwbpTOhfba5MvSjtFJ8LwMD7I+yN
	zydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DPVIeSYfWs/V7MFlg+nsYuEG+eMo4+Vy7Lys1OwEOK4=;
	b=cGW8YASqb/39lXfXt7AOXOB4zEoqWNqYeuuaby38ezPsvspv8x6gpqlv7tH7o3Ot57
	sD8OU9+1GWjSdigE2/1yJiTlqPMxZ27Ny/WZ6HVpMRlu5OPXexr/81fGQO+l5f5rxB98
	8Oe6PM1gwFCWU4rHJF7XNhD21QyAURAuMb28UTukWOsWSR/37kmLzO4fCb+67zyWQFDp
	Xpwva+aJ9l/iA/sgxTE15H38+yEI2KCC7Ui/ShREzaT37jqacMtmJfGNw6RgKpOhjxRj
	/fyLbdkOtYeEhi9d+viycQHWxz2ZJBIOIhBJ+H5erm+jxEAmHVAX29R44oNZzI2o1ueS
	e8Ww==
X-Gm-Message-State: AHPjjUiBtmj0brtzMArEy2g+ojr5a3bXRBKhtbnk9U+cYNfNmHpnHyld
	QfSnChAe7DycU4wJ
X-Google-Smtp-Source: ADKCNb63k+06uawRTFPSHxkyMY+Vyn3ZBzSME7z1WdBV7dwT0X4IfaA1Qkh4ri1fHYgkTI8DDw1/Qw==
X-Received: by 10.101.75.201 with SMTP id p9mr4766259pgr.281.1504912920118;
	Fri, 08 Sep 2017 16:22:00 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:21:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:36 -0700
Message-Id: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [daisy][PATCH 00/15] SRC_URI and minor dependency fixes
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
X-List-Received-Date: Fri, 08 Sep 2017 23:21:59 -0000

Daisy has now (long since) left upstream maintenance and entered into
community support. As a member of a community which still actively
develops against this version of OE, I would like to propose the
following updates.

The SRC_URI fixes address fetcher failures which have crept in over
time and now cause build failures for new users etc who don't already
have a fully populated downloads directory.

The two dependency fixes are historical but often go unnoticed when
building on a fully installed host system. Unfortunately they become
more problematic when building within a minimal docker container etc
where the host versions of the tools are not installed by default.

Alejandro Hernandez (1):
  kernel: Added bc-native as DEPENDS

Alexander Kanavin (1):
  ossp-uuid: update SRC_URI to not use Google Code

Andre McCurdy (5):
  dpkg: update SRC_URI
  libproxy: update SRC_URI
  lsof: update SRC_URI
  netbase: update SRC_URI
  mklibs-native: update SRC_URI

Chang Rebecca Swee Fun (1):
  cryptodev-linux: update SRC_URI

Maxin B. John (1):
  ossp-uuid: use snapshot.debian.org for SRC_URI

Richard Purdie (1):
  pigz: Update SRC_URI

Robert Yang (4):
  base-passwd: fix SRC_URI
  dosfstools: fix SRC_URI
  mailx: fix SRC_URI
  stat: fix SRC_URI

Yue Tao (1):
  setserial: add missing depends on groff-native

 meta/classes/kernel.bbclass                          | 2 +-
 meta/recipes-bsp/setserial/setserial_2.17.bb         | 2 ++
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb  | 2 +-
 meta/recipes-core/netbase/netbase_5.2.bb             | 2 +-
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb  | 3 ++-
 meta/recipes-devtools/dpkg/dpkg.inc                  | 2 +-
 meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb | 2 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb   | 3 ++-
 meta/recipes-extended/lsof/lsof_4.87.bb              | 2 +-
 meta/recipes-extended/mailx/mailx_12.5.bb            | 4 ++--
 meta/recipes-extended/pigz/pigz.inc                  | 2 +-
 meta/recipes-extended/stat/stat_3.3.bb               | 2 +-
 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc      | 2 +-
 meta/recipes-support/libproxy/libproxy_0.4.11.bb     | 2 +-
 14 files changed, 18 insertions(+), 14 deletions(-)

-- 
1.9.1


