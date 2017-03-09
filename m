Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB9A071AE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 00:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v290iSV5003707; Thu, 9 Mar 2017 00:44:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IKwt2Muxz09P; Thu,  9 Mar 2017 00:44:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v290iNZ7003704
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 00:44:24 GMT
Message-ID: <1489020263.22968.88.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 09 Mar 2017 00:44:23 +0000
In-Reply-To: <1489018715.22968.86.camel@linuxfoundation.org>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
	<CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
	<1488996030.22968.78.camel@linuxfoundation.org>
	<20170308184136.GF3279@jama>
	<1489018715.22968.86.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Thu, 09 Mar 2017 00:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 00:18 +0000, Richard Purdie wrote:
> How badly do people dislike the patch below?
> 
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Subject: bitbake/oe-core: Filter contents of PATH
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> index d6bcfa3..dbb74dd 100644
> --- a/bitbake/lib/bb/utils.py
> +++ b/bitbake/lib/bb/utils.py
> @@ -1526,3 +1526,13 @@ class LogCatcher(logging.Handler):
>          self.messages.append(bb.build.logformatter.format(record))
>      def contains(self, message):
>          return (message in self.messages)
> +
> +def setup_native_bindir(dest, toolsvar, d):
> +    tools = d.getVar(toolsvar).split()
> +    path = os.environ.get("PATH")
> +    mkdirhier(dest)
> +    for tool in tools:
> +        desttool = os.path.join(dest, tool)
> +        if not os.path.exists(desttool):
> +            srctool = which(path, tool)
> +            os.symlink(srctool, desttool)
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 87c235f..21265ed 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -59,3 +59,14 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    oprofile->virtual/kernel \
>  "
>  
> +NATIVETOOLS = " \
> +    bash sh cut sed gcc ld git rm install which find xargs cat true
> mktemp \
> +    grep tar gzip touch cp mv basename dirname tr getopt sort awk
> head tail \
> +    mkdir patch uniq perl python chmod python3 ar strip expr ls make
> as \
> +    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir
> od diff \
> +    md5sum unlzma dd chrpath file pod2man gunzip python2.7 ln g++ [
> \
> +    taskset \

Adding "false true uname test hostname nm objdump objcopy cmp printf
env" gets this going much further. taskset is only above as I have
local patches in my build which use it for other experiments and I
added it just to get things working.

Cheers,

Richard

