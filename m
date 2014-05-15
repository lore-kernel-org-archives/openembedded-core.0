Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f174.google.com (unknown [209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4952D6098B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 01:45:20 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 9so349390ykp.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 18:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ClP+CzyOPATMH0yrYdxpetUsJdFsZD1YkoS01zIjE8E=;
	b=hp2Gq1fMN5MSLvrfY3I80yDGGhOy79kz1g9jdJRYCcgdg9Y3nA9bOOGPEIIFi1py9+
	NbiFtua0bWNAWzOy85YuCw8SO7oWVaIvnYuj+R/Y9+HAcMHHBobyO+oCxpirYiDS3yda
	VuWfv1g0EtoLCioUVBQDJW6f40CkCRyB6wU6+EJUO5tfH5+WpSH239R96tmudQAyRNJO
	h9a4ho+Uw6ItpoaBDcbd1QsqaLO4SUednDCLTzWtOmWjWkzj7BWynJpgCczwF00Z6mMC
	z7oi+t/uxpkbkzlc3fP521+OhztMWDpn/JWUHq3tWzCgAjop5I2J5ohXec4EIHGo+jvW
	8bAw==
X-Received: by 10.236.93.195 with SMTP id l43mr10919751yhf.40.1400117863042;
	Wed, 14 May 2014 18:37:43 -0700 (PDT)
Received: from localhost.localdomain ([201.53.199.239])
	by mx.google.com with ESMTPSA id k50sm576778yhc.21.2014.05.14.18.37.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 May 2014 18:37:42 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 22:37:26 -0300
Message-Id: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 0/2] wic: looking by plugins and .wks file in all layers
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
X-List-Received-Date: Thu, 15 May 2014 01:45:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This introduces a little wic usability enhanced. Now wic has the
ability to search in all layers looking by .wks files and plugins.

The aim is to provide the layers a way to keep .wks and plugins that
they use. Without this patch the user need to inform the full path of .wks, or put it
in scripts directory. Or, in case of plugins, only putting in scripts directory.

Example:

In .wks case, inside my custom layer I have the following files: 

scripts/lib/image/canned-wks/
 otns-directdisk-devel.wks
 otns-directdisk.wks
 otns-directsdcard-devel.wks
 otns-directsdcard.wks
 otns-nobml-directdisk-devel.wks
 otns-nobml-directsdcard-devel.wks

So, I do:

 $ wic list images
  otns-directdisk-devel                         Create a 'pcbios' direct disk image
  otns-directdisk                               Create a 'pcbios' direct disk image
  otns-nobml-directdisk-devel                   Create a 'pcbios' direct disk image
  otns-nobml-directsdcard-devel                 Create a 'pcbios' direct disk image
  otns-directsdcard                             Create a 'pcbios' direct disk image
  otns-directsdcard-devel                       Create a 'pcbios' direct disk image
  mkefidisk                                     Create an EFI disk image
  directdisk                                    Create a 'pcbios' direct disk image

And to plugins case, in another layer, I have:

scripts/lib/mic/plugins/source/
 bootimg-pcbios-myplugin.py


To sum up, this enhanced wic because users could keep .wks and plugins inside their own layers.

I don't know if using the 'scripts/lib/' is the best to keep files in layers. Any suggestion?

Thanks.

João Henrique Ferreira de Freitas (2):
  wic: add support to look in all layers and get .wks file
  wic: add support to look in all layers and get plugins

 scripts/lib/image/engine.py | 72 +++++++++++++++++++++++++++------------------
 scripts/lib/mic/plugin.py   | 28 ++++++++++++++----
 scripts/wic                 |  6 ++++
 3 files changed, 72 insertions(+), 34 deletions(-)

-- 
1.8.3.2


