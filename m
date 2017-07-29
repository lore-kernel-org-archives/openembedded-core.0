Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F16EE78538
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 07:40:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6T7eJ5v020852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 29 Jul 2017 08:40:21 +0100
Message-ID: <1501314019.22282.199.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 08:40:19 +0100
In-Reply-To: <cover.1501233796.git.ed.bartosh@linux.intel.com>
References: <cover.1501233796.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 29 Jul 2017 08:40:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v5 0/7] #11662 - wic should mount /boot
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
X-List-Received-Date: Sat, 29 Jul 2017 07:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-07-28 at 12:29 +0300, Ed Bartosh wrote:
> This patchset adds /boot to the /etc/fstab of root partition, making
> it mounted on boot. It also fixes reporting and testing issues
> caused by this change.
> 
> The patchset also fixes long standing bug: wic updated fstab
> inplace in rootfs directory. This causes other tasks working with
> rootfs directory to produce incorrect results or crash. This is
> fixed by hadlinking rootfs content to the temporary directory before
> updating fstab.
> 
> This approach caused do_image_tar to fail with the error "file
> changed as we read it"
> as hardlinking changes files ctime. In order to solve this we had to
> modify do_image_tar to ignore file changes.
> 
> Changes in v2: squashed patches by reviewer's request
> Changes in v3: unlink /etc/fstab in rootfs copy before updating it
> Changes in v4: used 'cp -a' instead of copyhardlinktree to avoid
>                do_image_tar failure due to changed ctime
> Changes in v5: back to hardlinking. ignored tar exit code 1.

This patchset had a couple of issues, the tar command change was a
bashism '[[' so I changed it to '['. The cp -a change also doesn't work
cross device so I resurrected one of the previous versions of that
patch that uses copyhardlinktree.

As I mentioned previously, if we can speed up that function, great. We
do need to handle cross device linkage though (and there may be an
optimisation to have wic use the same device for the temp rootfs?).

The updated series is going through tests again now.

Cheers,

Richard


