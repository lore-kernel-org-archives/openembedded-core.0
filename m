Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 27E477397F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:13:44 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id 970DF8E0DB;
	Mon,  9 Mar 2015 19:13:43 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP;
	Mon,  9 Mar 2015 19:13:43 +0100 (CET)
Message-ID: <54FDE2D7.4050409@topic.nl>
Date: Mon, 09 Mar 2015 19:13:43 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <54F9E933.9070508@topic.nl>
	<CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gst-ffmpeg is broken since the libav-9 introduction
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
X-List-Received-Date: Mon, 09 Mar 2015 18:13:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-03-15 16:24, Burton, Ross wrote:
>
> On 6 March 2015 at 17:51, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     Commit 4ceff7d0a1f28eb1ce5d288111015b__ff8d5e9a7e "libav: drop older
>     0.8.* and use libav-9 by default" removed libav 0.8 in favor of the
>     "9" edition. However, after compiling this for a MIPS box, the
>     gst-ffmpeg plugin now refuses to load and displays the following at
>     runtime:
>
>
> Hm, bad testing, sorry.  This would be why gstreamer-libav 1.0 defaults
> to using it's own internal copy of libav then. :/

There's actually a page long rant that displays on screen if you link 
externally, like we do...

> I see that gstreamer-ffmpeg_0.10 defaults to using the internal libav,
> and as the API clearly changed we need to do that.  Can you verify that
> removing external-libav from the PACKAGECONFIG fixes this problem?

Tried that, it required a small patch to the configure.ac script to make 
it past the configure stage:

Index: gst-ffmpeg-0.10.13/configure.ac
===================================================================
--- gst-ffmpeg-0.10.13.orig/configure.ac
+++ gst-ffmpeg-0.10.13/configure.ac
@@ -385,7 +385,7 @@ else
       if test -z "$srcdir" -o "$srcdir" = .; then
         confcmd=./configure
       else
-       confcmd="$origdir"/"$ac_top_srcdir"/gst-libs/ext/libav/configure
+       confcmd="$ac_top_srcdir"/gst-libs/ext/libav/configure
       fi

       AS_MKDIR_P(["$ac_top_build_prefix"gst-libs/ext/libav])


Then it at least gets a bit further, but then you get bombed by a load 
of missing includes/headers/classes/andwhatnots during compile.

I guess some of the 50 or so patches are intented to make it work with 
the external library, and hence break building against the included one.

-- 
Mike Looijmans

