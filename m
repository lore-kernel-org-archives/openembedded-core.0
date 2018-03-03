Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 97407784DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 15:50:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23FoFTt022695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 15:50:16 GMT
Message-ID: <1520092215.3436.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Jason Wessel
	<jason.wessel@windriver.com>
Date: Sat, 03 Mar 2018 15:50:15 +0000
In-Reply-To: <CAP9ODKrOspi_MOPfaV3bHZyc9iZfOCgyJO4Db8urtpyYUseyMQ@mail.gmail.com>
References: <1520022430-7908-1-git-send-email-jason.wessel@windriver.com>
	<CAP9ODKrOspi_MOPfaV3bHZyc9iZfOCgyJO4Db8urtpyYUseyMQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Use deltask instead of noexec for package_write_rpm
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
X-List-Received-Date: Sat, 03 Mar 2018 15:50:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-03-03 at 12:46 -0300, Otavio Salvador wrote:
> On Fri, Mar 2, 2018 at 5:27 PM, Jason Wessel <jason.wessel@windriver.
> com> wrote:
> > 
> > If you install an image into another image (this is the case for
> > custom initrd for example), it will fail with a non obvious python
> > backtrace.  This patch modifies the package_manager.py print which
> > package causes the failure for the future, if it is missing a
> > manifest.
> > 
> > The error you get looks like this:
> > 
> > oe-core/meta/lib/oe/package_manager.py', lineno: 534, function:
> > create_packages_dir
> >      0530:
> >      0531:    for dep in rpmdeps:
> >      0532:        c = taskdepdata[dep][0]
> >      0533:        manifest, d2 =
> > oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname,
> > d, multilibs)
> >  *** 0534:        if not os.path.exists(manifest):
> >      0535:            continue
> >      0536:        with open(manifest, "r") as f:
> >      0537:            for l in f:
> >      0538:                l = l.strip()
> > File: '/usr/lib/python3.5/genericpath.py', lineno: 19, function:
> > exists
> >      0015:# This is false for dangling symbolic links on systems
> > that support them.
> >      0016:def exists(path):
> >      0017:    """Test whether a path exists.  Returns False for
> > broken symbolic links"""
> >      0018:    try:
> >  *** 0019:        os.stat(path)
> >      0020:    except OSError:
> >      0021:        return False
> >      0022:    return True
> >      0023:
> > Exception: TypeError: stat: can't specify None for path argument
> > 
> > The root cause of the problem was determined to be the noexec
> > clause
> > in the image.bbclass.  When the package_write_rpm task runs it
> > expects
> > that a manifest will be generated.  Not running the task eliminates
> > the problem.
> > 
> > Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> What about the other image types?

FWIW I'm testing:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=d77755d02f23ba410a2c55596c4538b8c5c2f63a

(but haven't posted it yet, I will shortly, just wanted to check it was
roughly going to work first).

I'd propose taking my patch above along with Jason's patch rewritten to
add the bb.fatal().

Cheers,

Richard




