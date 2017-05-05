Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B15B771AC5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 13:10:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v45DAFYn005697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 5 May 2017 14:10:17 +0100
Message-ID: <1493989815.23535.152.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 05 May 2017 14:10:15 +0100
In-Reply-To: <1493985795-7748-1-git-send-email-amarnath.valluri@intel.com>
References: <1493985795-7748-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 05 May 2017 14:10:18 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] cross.bbclass: Preserve the bitbake configuration
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
X-List-Received-Date: Fri, 05 May 2017 13:10:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-05-05 at 15:03 +0300, Amarnath Valluri wrote:
> While preparing target_libdir and target_base_libdir we should
> preserve the
> bitbake configuration used for 'base_libdir' and 'libdir' instead of
> assuming
> ${base|exec}_prefix/${baselib}, which is not true in case of merged
> '/usr'.
> 
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/classes/cross.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 8757303..0195b26 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -53,8 +53,10 @@ SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
>  target_base_prefix := "${base_prefix}"
>  target_prefix := "${prefix}"
>  target_exec_prefix := "${exec_prefix}"
> -target_base_libdir = "${target_base_prefix}/${baselib}"
> -target_libdir = "${target_exec_prefix}/${baselib}"
> +base_libdir_suffix := "${@base_libdir.split(base_prefix)[1] if
> base_prefix != "" else base_libdir}"
> +libdir_suffix := "${@libdir.split(exec_prefix)[1] if exec_prefix !=
> "" else libdir}"
> +target_base_libdir = "${target_base_prefix}${base_libdir_suffix}"
> +target_libdir = "${target_exec_prefix}${libdir_suffix}"
>  target_includedir := "${includedir}"

I think both Ross and myself have fairly strong reservations about
making core class files practically unreadable in pursuit of this
"merged usr" goal.

Why can't you simply add a conf/distro/include/mergedusr.inc which does
something like:

target_base_libdir_class-cross = "xxx"

?

You'd then have a single include file which anyone wanting to do this
can select rather than complicating files which really don't need more
complication.

Cheers,

Richard




