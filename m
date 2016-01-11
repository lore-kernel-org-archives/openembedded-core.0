Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14F096072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:00:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0BF0gNq002962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jan 2016 07:00:42 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Jan 2016 07:00:41 -0800
To: Matthias Schiffer <mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
	<568AF96A.50302@windriver.com> <568B0443.5090407@universe-factory.net>
	<568B0B5D.8000209@windriver.com>
	<5692911F.1050601@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <5693C3A5.4010301@windriver.com>
Date: Mon, 11 Jan 2016 09:00:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <5692911F.1050601@universe-factory.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Mon, 11 Jan 2016 15:00:43 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 1/10/16 11:13 AM, Matthias Schiffer wrote:
(Trimming to just this comment)

> * I stand by my opinion that moving files automatically is a bad idea,
> and the FILES issue mentioned in the other thread further backs my point
> (besides that issue, I've mentioned relative symlinks and relative paths
> in general as problems that can break packages when their files are moved).

The issue is simply that MANY packages have a fixed way they install things, and
then other actions (do_install) "move" them around to the expected place.  We
follow that behavior with the fs-perms.txt and "move them around".

The only alternative I can think of is to move the fs-perms.txt processing at
the beginning of do_install.  It could then create the symlinks and directories
mentioned.  Then the install occurs and the tools would need to know how to deal
with it "or fail".  (I don't like the or fail..)

The other problem though is this would introduce a number of (potentially) empty
directories to the a given recipe's install which would kick off the QA
warnings.  (We'd need to resolve that issue first.)

> My proposal would be to change the fs-perms.txt handling to only check
> if nothing conflicts with default symlinks, but not to create or move
> anything. This is another point I'd like to get more input on.

The key here, it can be a lot of additional work (based on experience) to have
to go in and change the locations that things are installing components.  Things
that PROPERLY use gnu autoconf, and other variable systems have an advantage
here, but it's not unusual to see references to '/lib' (i.e. the /lib/firmware
case), or even to '/sbin' for the non "/usr/sbin" case.

We really want this path change, and setup to be seemless for the distro
developer.  Set up the values in the distro configuration (path variables and
fs-perms.txt in some cases) and provide necessary .bbappends or distro specific
version of base-files package.  Theoretically that SHOULD be all that is
required to define the 'filesystem'.

--Mark

