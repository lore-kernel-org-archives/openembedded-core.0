Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 159B577E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:25:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5R8PhmB002144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Jun 2017 09:25:45 +0100
Message-ID: <1498551943.3124.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Patrick Ohly
	<patrick.ohly@intel.com>
Date: Tue, 27 Jun 2017 09:25:43 +0100
In-Reply-To: <CA+chaQf=qedEY+V7b8WUG=YNKwANzTSabaY4DNZMa81V7-MiPQ@mail.gmail.com>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
	<1498550932.7464.29.camel@intel.com>
	<CA+chaQf=qedEY+V7b8WUG=YNKwANzTSabaY4DNZMa81V7-MiPQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 27 Jun 2017 09:25:45 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 08:25:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-27 at 10:12 +0200, Martin Jansa wrote:
> Is BB_DISKMON_DIRS enabled by default?
> 
> Quick grep shows it only in local.conf.sample*:
> meta/conf/local.conf.sample:BB_DISKMON_DIRS = "\
> meta/conf/local.conf.sample.extended:# inode is running low, it is
> enabled when BB_DISKMON_DIRS is set.
> meta/conf/local.conf.sample.extended:#BB_DISKMON_DIRS =
> "STOPTASKS,${TMPDIR},1G,100K WARN,${SSTATE_DIR},1G,100K"
> 
> and my jenkins builds are very close to default oe-core nodistro
> config, so I don't think I have that enabled.
> 
> Maybe I should enable it, or maybe it should be enabled by default if
> we cannot fix this exception stream.

We should run with disk monitoring on by default.

The ways a system can fail in an out of disk (or inode) are pretty
widespread, you could certainly "fix" this exception path but another
would come along and you'd be forever trying to fix all of them with no
real way to do it for all cases.

The actual damage running out of space does it also quite nasty,
usually zero length files in places where things outside our control
don't expect them (e.g. gcc).

This was why we wrote the disk monitoring code in the first place, with
two levels of action, warning the users, then hard stopping the build
to try and prevent the above corruption.

We did also try and ensure that corruption in DL_DIR and SSTATE_DIR is
at least detectable (checksums in downloads) or avoided (sstate uses
atomic moves).

So if its not default, we should make it default and I'd encourage
people to use it.

Cheers,

Richard



