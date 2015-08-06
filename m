Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54497734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 14:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t76ELu92006159; Thu, 6 Aug 2015 15:21:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hDOF0GtotUqg; Thu,  6 Aug 2015 15:21:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t76ELdis006106
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 6 Aug 2015 15:21:53 +0100
Message-ID: <1438870898.30467.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Thu, 06 Aug 2015 09:21:38 -0500
In-Reply-To: <95943e072596a3d06d3c2f164620373e18925f9a.1438816804.git.alejandro.hernandez@linux.intel.com>
References: <cover.1438816804.git.alejandro.hernandez@linux.intel.com>
	<95943e072596a3d06d3c2f164620373e18925f9a.1438816804.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemurunner: Improves checking for Server and Target IPs on qemus parameters
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
X-List-Received-Date: Thu, 06 Aug 2015 14:22:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-05 at 23:21 +0000, Alejandro Hernandez wrote:
> Fixes server hanging infinitely waiting for qemus process to let go of bitbake.lock
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index 1cf8f76..ff53af3 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -120,14 +120,17 @@ class QemuRunner:
>              cmdline = ''
>              with open('/proc/%s/cmdline' % self.qemupid) as p:
>                  cmdline = p.read()
> -            ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
> -            if not ips or len(ips) != 3:
> +	    try:
> +                ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
> +                if not ips or len(ips) != 3:
> +	            raise Exception
> +                else:
> +                    self.ip = ips[0]
> +                    self.server_ip = ips[1]
> +	    except Exception:
>                  logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
>                  self.stop()
>                  return False
> -            else:
> -                self.ip = ips[0]
> -                self.server_ip = ips[1]
>              logger.info("Target IP: %s" % self.ip)
>              logger.info("Server IP: %s" % self.server_ip)
>              logger.info("Waiting at most %d seconds for login banner" % self.boottime)

This is ok, however its not as pythonic as perhaps it could/should be.
Usually with python you should always trap specific exceptions, so in
this case you'd do:

try:
    y = x[1]
    if len(ips) != 3:
        raise ValueError
except IndexError, ValueError:
    <handle error>

You do this so that if something unexpected happens, the code doesn't
"swallow" the error but shows a complete traceback and failure.

The whitespace on this patch also looks a little bit odd although I
didn't try applying the patch.

Cheers,

Richard


