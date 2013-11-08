Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3C2D6D5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:42:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA8Fgt1o013759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2013 07:42:55 -0800 (PST)
Received: from [0.0.0.0] (147.11.178.22) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 8 Nov 2013 07:42:54 -0800
Message-ID: <527D067C.6040709@windriver.com>
Date: Fri, 8 Nov 2013 10:42:52 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1383923945.2345.5.camel@ted>
In-Reply-To: <1383923945.2345.5.camel@ted>
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] lib/oe/path: Fix performance issue got copyhardlinktree()
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
X-List-Received-Date: Fri, 08 Nov 2013 15:42:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-08 10:19 AM, Richard Purdie wrote:
> With the directory copy was added to avoid race issues, it wasn't noticed that
> tar was recursing the directories and copying files too. This is completely
> crazy when we hardlink those files in the next command.
>
> Resolve the issue by telling tar not to recurse. This gives a significant
> performance boost to various parts of the system (do_package for linux-yocto
> 256s -> 178s for example).

Every second makes a difference in this beast .. when adding up a
zillion package runs a week. :)

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 1310e38..d0588ba 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -93,7 +93,7 @@ def copyhardlinktree(src, dst):
>       if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>           # Need to copy directories only with tar first since cp will error if two
>           # writers try and create a directory at the same time
> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - | tar -xf - -C %s' % (src, src, dst)
> +        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>           if os.path.isdir(src):
>               src = src + "/*"
>
>


