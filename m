Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SCb50-0005aG-7t
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 20:25:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2012 11:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146407067"
Received: from unknown (HELO [10.255.12.80]) ([10.255.12.80])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 11:16:11 -0700
Message-ID: <4F7203EA.4030104@linux.intel.com>
Date: Tue, 27 Mar 2012 11:16:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<1443918.kuu0Jnlh65@helios>
In-Reply-To: <1443918.kuu0Jnlh65@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Setup for VMDK to use Direct Disk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 18:25:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 07:37 AM, Paul Eggleton wrote:
> On Monday 26 March 2012 22:42:54 Saul Wold wrote:
>> Updated comments per Darren's request, added cleanup to
>> image-types to only use one -i (inode-count) parameter.
>
> I tried this series on my build machine, but do_rootfs failed with "genext2fs:
> not enough memory for filesystem".

Yes, there is an issue with genext2fs needing memory to build the 
filesystem first.  I noted in another email thread that the Debian build 
system had so resort to dd, mkfs.ext3, mounting and copying. The issue 
with that is that it requires root privileges which is forbidden with 
bitbake.

genext2fs combines the making and copying of the fs into one process, if 
there is a way to populate the filesystem image with the bits without 
root privs that's what we need to look towards.

This is turning into a non-trivial problem.

I am beginning to think that we might have to have 2 vmdk images for the 
build appliance to work correctly. 1 for the rootfs and the second for 
the build space (10G-20G) with DL_DIR populated.

>
> The machine has 6GB RAM and 8GB swap. The rootfs directory is 15GB.
>
> I guess this might have something to do with my DL_DIR not being clean
> beforehand (since it seems to be copying it into the rootfs in its entirety).
>
I have created a clean DL_DIR to work with by doing a world fetch and 
then using that DL_DIR to build into the image.

> Cheers,
> Paul
>


