Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46BC074BFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 14:23:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w93ENiwS013031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 3 Oct 2018 15:23:46 +0100
Message-ID: <6cb0ab6264c5d5b65759d18594c116ae01a8d801.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Oct 2018 15:23:44 +0100
In-Reply-To: <20181001154723.32161-1-gtertych@cisco.com>
References: <20181001154723.32161-1-gtertych@cisco.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Wed, 03 Oct 2018 14:23:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-01 at 18:47 +0300, grygorii tertychnyi via
Openembedded-core wrote:
> Append '\n' to the formatted string before return. If you write it
> to the (manifest) file, it will ensure file ends with a newline.
> 
> Many GNU utilities have problems processing the last line of a file
> if it is not '\n' terminated. E.g. if the last line is not terminated
> by a newline character, then "read" will read it but return false,
> leaving the broken partial line in the read variable(s).
> It can also break or adversely affect some text processing tools,
> that operate on the file.
> 
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
>  meta/lib/oe/utils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

If you enable buildhistory (INHERIT += 'buildhistory' in local.conf)
and then "bitbake buildtools-tarball", you'll see:

| DEBUG: Python function buildhistory_list_installed_sdk_target finished
| NOTE: Executing buildhistory_get_sdk_installed_target ...
| DEBUG: Executing shell function buildhistory_get_sdk_installed_target
| basename: missing operand
| Try 'basename --help' for more information.
| WARNING: /home/pokybuild/yocto-worker/nightly-arm/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/temp/run.buildhistory_get_sdk_installed_target.13414:1 exit 123 from 'xargs -n1 basename > $1/installed-packages.txt'
| DEBUG: Python function do_populate_sdk finished
| ERROR: Function failed: buildhistory_get_sdk_installed_target (log file is located at /home/pokybuild/yocto-worker/nightly-arm/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/temp/log.do_populate_sdk.13414)

which is buildhistory choking on the blank line.

Cheers,

Richard

