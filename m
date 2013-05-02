Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXu35-0002v2-1i
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:59:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r42Dfu0M003370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 May 2013 06:41:56 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 2 May 2013 06:41:56 -0700
Message-ID: <51826D24.2020403@windriver.com>
Date: Thu, 2 May 2013 08:41:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1367500809.14512.252.camel@phil-desktop.brightsign>
In-Reply-To: <1367500809.14512.252.camel@phil-desktop.brightsign>
Subject: Re: [PATCH] package.bbclass: Remove redundant chmod/chown operations
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 13:59:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/13 8:20 AM, Phil Blundell wrote:
> These were introduced in 6021e309e69d823e1467648aee12a32182945569.  The
> code currently reads:
>
>                  os.link(file, fpath)
>                  fstat = cpath.stat(file)
>                  os.chmod(fpath, fstat.st_mode)
>                  os.chown(fpath, fstat.st_uid, fstat.st_gid)
>
> which can have no useful effect since, if "fpath" is a hard link to
> "file", it will (by definition) have the same mode, uid and gid.

I thought there were filesystems where a link operation can result in different 
file permissions, owners and groups.  It's rare, but umask and effective uid/gid 
could play a part in this.  (Mind you all of the operations should be happening 
when pseudo is running and should mask that behavior.)

> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   meta/classes/package.bbclass |    3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4136a9f..99eda77 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1000,9 +1000,6 @@ python populate_packages () {
>               fpath = os.path.join(root,file)
>               if not cpath.islink(file):
>                   os.link(file, fpath)
> -                fstat = cpath.stat(file)
> -                os.chmod(fpath, fstat.st_mode)
> -                os.chown(fpath, fstat.st_uid, fstat.st_gid)
>                   continue
>               ret = bb.utils.copyfile(file, fpath)
>               if ret is False or ret == 0:
>



