Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwj-0002GZ-8o
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:29 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so3493040wey.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=cAvcq0RPnCbXYnFNsBrueAmu0SSq4UimUqOJ6mfVYMw=;
	b=DxcvdI7uHX5TpGYSLXFW3exADs67uq5a5pf29Sb5GsFSDVRHTOeTcNaE0crdJxD4oH
	TL7kzZFrkIE2BjTg/Vk72vmixyuyw8HeVJtcLA0b4Ufpkil9ZYkk9MNNczPuoux3N2k3
	J9bkvtuMJe24XCA+l2Po1FbdgmbKWcXRj820o9XvvbrIZYjR561x5NGg7HkzZerZW32V
	TQy73PHTBLrrow26DVIYjTNhZaMkvm3o9bFQgdYA7B8vbaLv1IaeH7EQSxZpFecONApi
	VsXJ5wlSB3LgGw8S7gtCYdpvouoayORi4DV2cJQp4S/AU9rOaiOA6XFYf1ctlStRUuYr
	jm7w==
X-Received: by 10.195.13.200 with SMTP id fa8mr12623079wjd.15.1360363534843;
	Fri, 08 Feb 2013 14:45:34 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:14 +0000
Message-Id: <cover.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmPjdiWX9l1JMwKJweabTgW1zgoSlSOGiwPjc/N8VTnksTLTs+jJHEu0/C4M5vlcV+T24i1
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/5] systemd class, and more enabling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 23:01:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series introduces a systemd class (largely based on the work in
meta-systemd) and changes update-rc.d.bbclass so that it doesn't do anything if
systemd.bbclass was also inherited *and* systemd is enabled.

As examples, avahi, connman and wpa-supplicant are updated to use the new class.

Note that the new class does have slightly different semantics to the
meta-systemd class, so merging the rest of the changes in meta-systemd that are
relevant to oe-core should happen sooner rather than later.

Ross

The following changes since commit 20b4dcace222d6b1d659a8813b4affad075ec0c6:

  dbus-native: Don't install dbus-launch (2013-02-08 14:50:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to cba1dc1c04201b8f08fca587a7433238a5ddaa33:

  wpa-supplicant: Enabling with systemd (2013-02-08 21:50:34 +0000)

----------------------------------------------------------------
Radu Moisan (3):
      connman: Enabling with systemd
      avahi: Enabling with systemd
      wpa-supplicant: Enabling with systemd

Ross Burton (2):
      systemd.bbclass: helper class for recipes with systemd units
      update-rc.d: don't do anything if systemd.bbclass is inherited

 meta/classes/systemd.bbclass                       |  158 ++++++++++++++++++++
 meta/classes/update-rc.d.bbclass                   |   19 ++-
 meta/recipes-connectivity/avahi/avahi.inc          |   21 ++-
 meta/recipes-connectivity/connman/connman.inc      |   11 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   13 +-
 5 files changed, 200 insertions(+), 22 deletions(-)
 create mode 100644 meta/classes/systemd.bbclass

Radu Moisan (3):
  connman: Enabling with systemd
  avahi: Enabling with systemd
  wpa-supplicant: Enabling with systemd

Ross Burton (2):
  systemd.bbclass: helper class for recipes with systemd units
  update-rc.d: don't do anything if systemd.bbclass is inherited

 meta/classes/systemd.bbclass                       |  158 ++++++++++++++++++++
 meta/classes/update-rc.d.bbclass                   |   19 ++-
 meta/recipes-connectivity/avahi/avahi.inc          |   21 ++-
 meta/recipes-connectivity/connman/connman.inc      |   11 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   13 +-
 5 files changed, 200 insertions(+), 22 deletions(-)
 create mode 100644 meta/classes/systemd.bbclass

-- 
1.7.10.4



