Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21D257822D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 10:16:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OAGUeS003604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 11:16:31 +0100
Message-ID: <1503569790.32591.187.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Holger =?ISO-8859-1?Q?Schr=F6der?= <holger@holgis.net>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 11:16:30 +0100
In-Reply-To: <1347152023.25658.1503569657844@office.mailbox.org>
References: <1911181157.25321.1503568263847@office.mailbox.org>
	<1347152023.25658.1503569657844@office.mailbox.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 11:16:31 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] ignore .svn directory in intercepts_dir
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
X-List-Received-Date: Thu, 24 Aug 2017 10:16:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-24 at 12:14 +0200, Holger Schröder wrote:
> Hi all,
> 
> i would like to get this patch into openembedded-core.
> i hope this mail is in the correct form. Please tell
> me if not.
> 
> kind regards, Holger
> 
> Patch description:
> 
> A customer of mine still runs svn. And when i build
> a rootfs in a jenkins job on the master node, i get
> a python exception because the .svn directory cannot
> be executed as an interceptor as it seems.
> 
> With this patch a possible ".svn" subdirectory in
> that directory will be ignred, and my jenkins build
> succeeds.
> 
> Signed-off-by: Holger Schröder <holger@holgis.net>
> ---
>  meta/lib/oe/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 96591f3..e99aa67 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -296,7 +296,7 @@ class Rootfs(object, metaclass=ABCMeta):
>          for script in os.listdir(intercepts_dir):
>              script_full = os.path.join(intercepts_dir, script)
>  
> -            if script == "postinst_intercept" or not
> os.access(script_full, os.X_OK):
> +            if script == "postinst_intercept" or script == ".svn" or
> not os.access(script_full, os.X_OK):
>                  continue
>  
>              bb.note("> Executing %s intercept ..." % script)


I think a better, more general solution here would be to add:

if script.startswith("."):
     continue

?

Cheers,

Richard



