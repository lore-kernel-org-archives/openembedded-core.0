Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id BCC2D786E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 14:21:36 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id EE0865C0988;
	Mon, 11 Dec 2017 15:15:38 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 11 Dec 2017 15:16:44 +0100
From: Stefan Agner <stefan@agner.ch>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
Message-ID: <1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513001738; bh=fvmoPxtbTyU0NGtJCkBbj69KaGGTeb9ByVAGwfdqKt8=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=iJnQpB7tYIIc7oAaVvxQ1aQfL4oyuutidaxpZf2rGFfcQw2Tm0BEouK9miH0DsEz84L85ZBPot9uel4UH5r8fmAosJCjBbj/7ttAhE551TQkgqpK0szOj7qz70PqQCfQCfWFjDFE1nyAQFiiAVD7KIesPRIg+XPzXEnfXcqCpeo=
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Mon, 11 Dec 2017 14:21:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-11 15:01, Burton, Ross wrote:

> On 11 December 2017 at 13:57, Stefan Agner <stefan@agner.ch> wrote:
> 
>> From: Stefan Agner <stefan.agner@toradex.com>
>> 
>> On some build hosts distros (e.g. Fedora 26) waf tries to be
>> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
>> This obviously is not what we want for 32-bit targets and usually
>> fails in the do_package phase:
>> WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
>> /usr/lib64/libgstimxcommon.so.0
>> 
>> Explicitly pass libdir to waf reliably resolves the issue.
> 
> What happens if the wscript doesn't recognise --libdir, does it silently ignore it or throw an error? 

Hm, isn't this a "base" option which is always supported?

> 
> If waf supports prefix and libdir and doesn't error on unknown options, does it also support datadir/sysconfdir and so on?  We should pass as much as possible.  The gnu_dirs module suggests yes, so you could copy what autotools passes. 
> 

There are a bunch of others. But most seem to derive from PREFIX, which
we set...

  Installation prefix:                                                  
                                                                   
    By default, "waf install" will put the files in "/usr/local/bin",
"/usr/local/lib" etc. An installation prefix other than               
    "/usr/local" can be given using "--prefix", for example
"--prefix=$HOME"                                                        
       
                                                                        
                                                                   
    --prefix=PREFIX     installation prefix [default: '/usr/local/']  
    --destdir=DESTDIR   installation root [default: '']               
    --exec-prefix=EXEC_PREFIX      
                        installation prefix for binaries [PREFIX] 

  Installation directories:        
    --bindir=BINDIR     user commands [EXEC_PREFIX/bin]               
    --sbindir=SBINDIR   system binaries [EXEC_PREFIX/sbin]            
    --libexecdir=LIBEXECDIR        
                        program-specific binaries [EXEC_PREFIX/libexec] 
                                                                   
    --sysconfdir=SYSCONFDIR        
                        host-specific configuration [PREFIX/etc]      
    --sharedstatedir=SHAREDSTATEDIR                                   
                        architecture-independent variable data
[PREFIX/com]                                                            
    
    --localstatedir=LOCALSTATEDIR  
                        variable data [PREFIX/var]                    
    --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib64]     
    --includedir=INCLUDEDIR        
                        header files [PREFIX/include]                 
    --oldincludedir=OLDINCLUDEDIR  
                        header files for non-GCC compilers
[/usr/include]                                                          
        
    --datarootdir=DATAROOTDIR      
                        architecture-independent data root
[PREFIX/share]                                                          
        
    --datadir=DATADIR   architecture-independent data [DATAROOTDIR]   
    --infodir=INFODIR   GNU "info" documentation [DATAROOTDIR/info]   
    --localedir=LOCALEDIR          
                        locale-dependent data [DATAROOTDIR/locale]    
    --mandir=MANDIR     manual pages [DATAROOTDIR/man]                
    --docdir=DOCDIR     documentation root [DATAROOTDIR/doc/PACKAGE]  
    --htmldir=HTMLDIR   HTML documentation [DOCDIR]                   
    --dvidir=DVIDIR     DVI documentation [DOCDIR]                    
    --pdfdir=PDFDIR     PDF documentation [DOCDIR]                    
    --psdir=PSDIR       PostScript documentation [DOCDIR]   

--
Stefan

