Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE676C254
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:03:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wADA3CJd012868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 13 Nov 2018 10:03:14 GMT
Message-ID: <54ebce2e5465961129b4740cba726f52c9e7d726.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 10:03:12 +0000
In-Reply-To: <1542099878-266444-1-git-send-email-changqing.li@windriver.com>
References: <1542099878-266444-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] oepydevshell-internal.py: decode only when readdata is valid
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
X-List-Received-Date: Tue, 13 Nov 2018 10:03:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-13 at 17:04 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below problem:
> pydevshell raises exception when maximize the python shell window.
> when click maximize, rlist of select return ready object, but the
> pty.read is None, so throw exception of 'NoneType' object has no
> attribute 'decode', change to only decode when readdata is valid.
> 
> [YOCTO #11875]
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  scripts/oepydevshell-internal.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-
> internal.py
> index 04621ae..2d1bc77 100755
> --- a/scripts/oepydevshell-internal.py
> +++ b/scripts/oepydevshell-internal.py
> @@ -63,7 +63,10 @@ try:
>              (ready, _, _) = select.select([pty, sys.stdin], writers
> , [], 0)
>              try:
>                  if pty in ready:
> -                    i = i + pty.read().decode('utf-8')
> +                    readdata=pty.read()
> +                    if readdata == None:
> +                        continue
> +                    i = i + readdata.decode('utf-8')

Usually you'd write this as:

if readdata:
    i = i + readdata.decode('utf-8')

Is there a reason not to do that here?

If you really want to test for None, you usually write:

if readdata is None:

which is a little more pythonic.

Cheers,

Richard


