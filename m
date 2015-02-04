Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCC26013C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 07:12:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t147CNXE012257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Feb 2015 23:12:23 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 3 Feb 2015 23:12:23 -0800
Message-ID: <54D1C656.7090505@windriver.com>
Date: Wed, 4 Feb 2015 15:12:22 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1420530290.git.Qi.Chen@windriver.com>
	<a6dc870be391940e782eae4a86b0002e764a163a.1420530290.git.Qi.Chen@windriver.com>
In-Reply-To: <a6dc870be391940e782eae4a86b0002e764a163a.1420530290.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 1/1] sstatesig.py: fix logic in find_siginfo
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
X-List-Received-Date: Wed, 04 Feb 2015 07:12:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 01/06/2015 03:47 PM, Chen Qi wrote:
> For now, `bitbake-diffsig -t <recipe> <task>' doesn't work. This is
> caused by a small logic mistake in find_siginfo in sstatesig.py.
>
> The logic should be 'and' instead of 'or', otherwise, we will have
> both siginfo and sigdata files in filedates which have the same checksum.
> e.g.
> /buildarea2/chenqi/sstate-cache/fc/sstate:sysstat:armv5te-poky-linux-gnueabi:10.2.1:r0:armv5te:3:fc861bf371c1b843b2843a3415eb5ff3_install.tgz.siginfo
> /buildarea2/chenqi/poky/build-systemd/tmp/stamps/armv5te-poky-linux-gnueabi/sysstat/10.2.1-r0.do_install.sigdata.fc861bf371c1b843b2843a3415eb5ff3
>
> So `bitbake-diffsig -t sysstat install' will output nothing even we actually
> have changed something in do_install task.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/lib/oe/sstatesig.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index af7617e..c6c85b9 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -234,7 +234,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>               except OSError:
>                   continue
>   
> -    if not taskhashlist or (len(filedates) < 2 and not foundall):
> +    if not taskhashlist and (len(filedates) < 2 and not foundall):
>           # That didn't work, look in sstate-cache
>           hashes = taskhashlist or ['*']
>           localdata = bb.data.createCopy(d)


