Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 96A0473772
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 07:50:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2015 00:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,624,1427785200"; d="scan'208";a="747456279"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.62])
	by orsmga002.jf.intel.com with ESMTP; 16 Jun 2015 00:50:32 -0700
Date: Tue, 16 Jun 2015 10:50:40 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150616075040.GA10146@lpalcu-linux>
References: <1434111318-12593-1-git-send-email-laurentiu.palcu@intel.com>
	<CAJTo0LYnsO=8GnT+6U1dOssUAbcgWNEEVD1y_niOLyaED4ak3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYnsO=8GnT+6U1dOssUAbcgWNEEVD1y_niOLyaED4ak3Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] scripts: Add cleanup-downloads-dir tool
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
X-List-Received-Date: Tue, 16 Jun 2015 07:50:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Mon, Jun 15, 2015 at 11:38:01PM +0100, Burton, Ross wrote:
> 
> On 12 June 2015 at 13:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> 
>     A few days ago I noticed I had no space on disk and decided to make some
>     space. Since my downloads directory was never deleted since denzil, it
>     consumed 25GB of space which I needed. However, I wanted to delete only old
>     and unneeded tarbals/git repos and keep the ones that my current Yocto
>     version needed, so I wrote this tool.
> 
> 
> Something is not quite right, after running this and causing a rebuild I got this:
> 
> ERROR: No checksum specified for /home/ross/Yocto/downloads/git2_git.lttng.org.lttng-modules.git.tar.gz, please add at least one to
> the recipe:
> SRC_URI[md5sum] = "c32ceb7d4b208b2b1d8132c3bbc7d638"
> SRC_URI[sha256sum] = "d593cca435003770e981c8ae5def3db0e95d72bc3f83f3d43a18287ea1f6d165"
> ERROR: Function failed: Fetcher failure for URL: 'http://downloads.yoctoproject.org/mirror/sources/
> git2_git.lttng.org.lttng-modules.git.tar.gz'. Missing SRC_URI checksum
> 
> A few too many files pruned?
Thanks for giving this a test. However, I have no idea why this happens
for you... I ran it on my side, after compiling lttng-modules (so it
fetches the latest, etc), and the tarballs were not removed. Actually,
nothing was removed since I ran it on master, after doing a fresh
core-image-minimal build... See below. Can you please try a: 'bitbake
lttng-modules' followed by a 'cleanup-downloads-dir'? Do you get the
same behavior on the first rebuid? Could there's something else going on
at your side?

test@test-machine:/ssd/work/yp1/test$ bitbake lttng-modules
...
build output skipped
...
test@test-machine:/ssd/work/yp1/test$ cleanup-downloads-dir
Parsing recipes..done.
Generating unused files list... done

No obsolete files found in /ssd/work/yp1/test/downloads.
test@test-machine:/ssd/work/yp1/test$ ls -la downloads/ |grep lttng-modules
-rw-rw-r--  1 test test   1861595 May 13 11:26 git2_git.lttng.org.lttng-modules.git.tar.gz
-rw-rw-r--  1 test test         0 Jun 16 09:45 git2_git.lttng.org.lttng-modules.git.tar.gz.done
-rw-rw-r--  1 test test       125 Jun 16 09:45 lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch.done
test@test-machine:/ssd/work/yp1/test$ ll downloads/git2 |grep lttng-modules
drwxr-xr-x  7 test test  4096 May 13 11:26 git.lttng.org.lttng-modules.git/
-rw-rw-r--  1 test test     6 Jun 16 09:45 git.lttng.org.lttng-modules.git.done

laurentiu

