Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4bIS-0000Ff-Gj for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 18:29:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGUguH029401 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:30:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7Jd4M-KyLVel
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:30:42 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGUba2029390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:30:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 17:24:25 +0100
In-Reply-To: <1316186907.2384.90.camel@elmorro>
References: <1316186907.2384.90.camel@elmorro>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316190273.20858.31.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] package.bbclass: fix spurious 'installed but not shipped' warning
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
X-List-Received-Date: Fri, 16 Sep 2011 16:29:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 10:28 -0500, Tom Zanussi wrote:
> For packages that have files installed that aren't in a subdirectory,
> the following build WARNING is emitted (this for initramfs-live-boot
> as an example):
> 
> WARNING: For recipe initramfs-live-boot, the following files were
>  installed but not shipped in any package:
> WARNING:   init
> 
> The problem is that the filenames added to the 'seen' array are always
> added with a path separator at the beginning of the filename, but when
> the package dir is walked for comparison, any files at the top-level
> will be missing the beginning path separator and the comparison will
> fail despite the fact that the file was actually packaged.  This
> because the remainder between the dirname and the dvar base name is
> used in the path join and in the case of files at the top-level, the
> remainder is the empty string, where it should be '/' for comparison
> purposes.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/classes/package.bbclass |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)

Good fix, merged to master, thanks.

Richard



