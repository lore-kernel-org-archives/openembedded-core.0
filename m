Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 96F7071F23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 18:52:34 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so40384106pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 10:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tho0oihqgJaaGlzPgSIY5wt0eLh0AMOaLmn80hWdp6M=;
	b=Yw1TAPb5+T/ztIe/z5btc980Tr5TuxJHxBZvTzvGVUQmvx9hIfaXJ69GJqUOvK7ZPH
	3dKHMKK67Ga/GhsjL1QFkqNC6GWgcXA4GUq7tYOqGM4vBu0VQ3wuqbhhoXScTo9aFlEd
	vojAEbr3KomfWUsMeXmNrn/ev95EqCfBai15JCkS4EmfE4UNlSuc72o6GtU/rtJ55NUi
	xPmhwb3C33f82bNIKiROn11NEB+32dW9w0EZX8CLyX1FmhrZ0A0FZFqzXUV+TKGI9yiu
	e7s+GRR5IBzkuFXnb8R/0W8LvilDvXjZRGle3lZ9TXI1ePj+MDGOmjfTKscGzDSigkXV
	2tJQ==
X-Received: by 10.70.89.225 with SMTP id br1mr41127308pdb.8.1421693555297;
	Mon, 19 Jan 2015 10:52:35 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id tr8sm796508pbc.30.2015.01.19.10.52.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Jan 2015 10:52:34 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jan 2015 11:52:29 -0700
Message-Id: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCHv2 0/2] recipetool: add python buildsystem support
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
X-List-Received-Date: Mon, 19 Jan 2015 18:52:37 -0000

Changes from v1:

- Drops the 'your responsibility' message, per Paul's request
- Pulls in sys.builtin_module_names from the host python for now
- Handles extra_requires both in requires.txt and setup.py. This is currently
  implemented by a naive conversion of the optional features to
  packageconfigs.
- Improves the way we extract the setup keywords to make it easier to grab the
  non-literal values, such as calls to `find_packages`, so we can implement
  that in the future.
- Alters the existing LICENSE line from recipetool rather than adding
  a duplicated one, by poking at `lines_before`.
- Moves the HOMEPAGE/SUMMARY/etc below the license info but above SRC_URI, to
  comply with our conventions.
- Defaults to python- prefixing the dependencies we add.
- Fixes numerous bugs.


Example of the generated `PACKAGECONFIG` for `extra_requires` in glances:

```
# The following configs & dependencies are from setuptools extras_require.
# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
# The upstream names may not correspond exactly to bitbake package names.
#
# Uncomment this line to enable all the optional features.
#PACKAGECONFIG ?= "web batinfo snmp chart sensors browser"
PACKAGECONFIG[web] = ",,,python-bottle"
PACKAGECONFIG[batinfo] = ",,,python-batinfo"
PACKAGECONFIG[snmp] = ",,,python-pysnmp"
PACKAGECONFIG[chart] = ",,,python-matplotlib"
PACKAGECONFIG[sensors] = ",,,python-py3sensors"
PACKAGECONFIG[browser] = ",,,python-netifaces python-zeroconf"
```


Christopher Larson (2):
  recipetool: add python buildsystem support
  recipetool: add python dependency scanning support

 scripts/lib/recipetool/create_buildsys_python.py | 720 +++++++++++++++++++++++
 scripts/pythondeps                               | 250 ++++++++
 2 files changed, 970 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_buildsys_python.py
 create mode 100755 scripts/pythondeps

-- 
2.2.1


