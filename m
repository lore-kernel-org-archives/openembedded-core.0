Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RwtTG-00030D-Mq
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 11:49:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1DAfBOs029267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2012 02:41:11 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 13 Feb 2012 02:41:11 -0800
Message-ID: <4F38E8CB.6090101@windriver.com>
Date: Mon, 13 Feb 2012 18:41:15 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F21BE12.3000008@linux.intel.com>
	<4F24F672.5090107@linux.intel.com>
In-Reply-To: <4F24F672.5090107@linux.intel.com>
X-Originating-IP: [128.224.162.223]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Source Archiver Class
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
X-List-Received-Date: Mon, 13 Feb 2012 10:49:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saul,

I have some issues when I writing design document. The following 
description is my  understanding. I take package "zlib" for example .
>
>
> This is a progression list of what the source archives should include:
>
> 1 - Original Upstream Archive & Patches
>     - 2 archives (tarballs)
$ls zlib-orgsource
zlib-1.2.5.tar.bz2(after do_fetch)
zlib-patches.tar.bz2( the patches come from 
meta/recipes-core/zlib/zlib-1.2.5)
> 2 - Original Source code & Patches
>     - could include additional code
          Please give me more detailed information
>     - post unpack
>     - 1 archive
$ls zlib-orgsource
zlib-1.2.5.tar.bz2(after do_unpack, patches are not included in this 
package.)

No patch in this directory.
>
> 3 - Original Source code & Patches & temp (scripts & logs)
>     - Could possibly include the .bb and .inc files
>     - 2 archives (from #2 & temp tarball)
$ls zlib-orgsource
  zlib-1.2.5.tar.bz2(after do_unpack, patches are not included in this 
package.)
  zlib-patches.tar.bz2( the patches come from 
meta/recipes-core/zlib/zlib-1.2.5)
  zlib-scripts-logs.tar.bz2(include zlib_1.2.5.bb,zlib.inc and tmp/log_*)

So there are 3 tarballs in this directory.
> 4 - Patched source code
>     - original source code could be removed
>     - post do_patch
$ls zlib-source
zlib-1.2.5.tar.bz2(after do_patch)
> 5 - Patched source code & temp
>     - 2 archives (from #4 & temp tarball)
$ls zlib-source
zlib-1.2.5.tar.bz2(after do_patch)
zlib-logs.tar.bz2(include tmp/log_*)
> 6 - Configured Source
>     - post do_configure
$ls zlib-source
zlib-1.2.5.tar.bz2(after do_configure)
> 7 - SRPM format of Original Source & Patches
>   - rpm will apply the patches
>   - internally contains #2 above
$ls zlib-srpm
zlib-1.2.5.src.rpm

zlib-1.2.5.src.rpm includes zlib-1.2.5.tar.bz2(after do_unpack, patches 
are not included in this package.) and zlib-patches.tar.bz2
> 8 - SRPM various of #3 above
$ls zlib-srpm
zlib-1.2.5.src.rpm

zlib-1.2.5.src.rpm includes zlib-1.2.5.tar.bz2(after do_unpack, patches 
are not included in this package.) ,zlib-patches.tar.bz2 and 
zlib-scripts-logs.tar.bz2

Do you have any suggestion about the above description?

Thanks
Yan


> ...
> 100 - Buildable SRPM
>   - can actually build, this is way future!
>
> (Patches = patch files & series list)
>
> Each of these build on the previous in some way, the key being that we
> generate a tarball for the source from the existing state of the
> WORKDIR, a challenge maybe to create the source snapshot after the build
> has already occurred.
>
> The SPDX License info could also be included in any of these
>
> After talking with Richard, we think we have a novel approach to make
> this work. It would entail using the postfuncs feature similar to the
> way that Shared State does it's work. The existing copyleft_compliance
> class functionality can be folded into this as a filter. Additional
> flags could be passed from individual classes to a core set of methods
> in an archiver class defining the type of data (source, patches, temp,
> env, recipe info, ...) and format (tar, sprm, ...)
>
> I noted that recipe type code might be better suited as generic code, as
> I believe there are other places that could benefit from that code.
>
> The sourcepkg class seems to be a basic archiver and differ that
> includes the metadata/environment (as dumpdata), this could be replaced
> by the new approach.  While the src_distribute class copies the
> downloaded archive and then creates a link, into LICENSE directories
> along with the patches. The src_distribute by default seems to move
> files and create links (incorrectly btw!). This work can be done by the
> archiver class.
>
> The Nugget: Create a new core "archiver" class that implements a general
> functions that can archive the original tarball or workdir at various
> states along task list with additional metadata (recipe info, temp dir,
> environment). This class would be inherited by a set of classes that use
> the postfunc (similar to sstate) that setup what level of archive is
> needed (based on the list above).
>
> Thoughts, Comments?
>
> Thanks
>
>
>



