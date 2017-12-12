Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 394CC78852
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 14:43:10 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C7C585C1007;
	Tue, 12 Dec 2017 15:37:11 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 12 Dec 2017 15:38:17 +0100
From: Stefan Agner <stefan@agner.ch>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
	<abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
	<CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
Message-ID: <370cbd8d94d10bbb85e12e08b742f060@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513089431; bh=+o9D7UbY9x4dwG0aoKtB15P7aigTlfEtWFG3HDq20pA=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=0KON9Af7pwL92AnQJK7LOIY5vue28eGmfr8laobG8LT7TiL9Lklnz4wTFq8R0oSn01mjnULmQUEc8H9t8cyw+cwreUlvTbZmLkxY72oiYj/jDGK5sBs3UPBuSpQ7mPO1QYXrMbv8XDsot3VlytOjD/qoKXH9JkUl2Q3x/BSPJCg=
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 14:43:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-12 15:13, Burton, Ross wrote:

> On 12 December 2017 at 14:03, Stefan Agner <stefan@agner.ch> wrote:
> 
>> On 2017-12-12 15:00, Burton, Ross wrote:
>> 
>>> On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch> wrote:
>>> 
>>>> On some build hosts distros (e.g. Fedora 26) waf tries to be
>>>> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
>>>> This obviously is not what we want for 32-bit targets and usually
>>>> fails in the do_package phase:
>>>> WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
>>>> /usr/lib64/libgstimxcommon.so.0
>>>> 
>>>> Waf knows prefix, bindir and libdir as default options. Explicitly
>>>> pass those three.
>>> 
>>> Obviously not.
>>> 
>>> ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed: do_configure (log file is located at /data/poky-tmp/master/build/work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278)
>>> ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278
>>> Log data follows:
>>> | DEBUG: Executing shell function do_configure
>>> | waf [commands] [options]
>>> |
>>> | Main commands (example: ./waf build -j4)
>>> |   build    : executes the build
>>> |   clean    : cleans the project
>>> |   configure: configures the project
>>> |   dist     : makes a tarball for redistributing the sources
>>> |   distcheck: checks if the project compiles (tarball from 'dist')
>>> |   distclean: removes the build directory
>>> |   install  : installs the targets on the system
>>> |   list     : lists the targets to execute
>>> |   step     : executes tasks in a step-by-step fashion, for debugging
>>> |   uninstall: removes the targets installed
>>> |   update   : updates the plugins from the *waflib/extras* directory
>>> |
>>> | waf: error: no such option: --bindir
>>> 
>> Hm, eglinfo seems to come with a old waf version, 1.7.8 to be specific.
>> 
>> It seems bindir/libdir got added in 1.8 series:
>> https://github.com/waf-project/waf/blob/waf-1.8/waflib/Options.py
>> 
>> Make version specific variables?
> 
> That neatly shows where the "clever code" that was breaking libdir earlier is: 
> 
> https://github.com/waf-project/waf/commit/823b4cd2dc03d06a81e0ab003606067da03d8745#diff-b44b0c8f383b2fd1b19f2ba039d30237 
> 

Yeah that seems to be it.

That go added in the 1.8.6 dev cycle afaik.

I am thinking about adding some kind of version autodetection

WAFMINOR=$(${S}/waf --version | sed -e '1{s/waf [0-9]\.//;s/\.[0-9]*
(.*//};q')

if [ $WAFMINOR -gt "7" ] ...

Maybe there is a nicer way of doing this?

--
Stefan

