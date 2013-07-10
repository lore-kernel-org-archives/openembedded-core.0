Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id BC903608BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 02:56:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.87,1032,1363104000"; d="scan'208";a="7843037"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 10 Jul 2013 10:53:44 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6A2ufUv026766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 10:56:41 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013071010550237-2818596 ;
	Wed, 10 Jul 2013 10:55:02 +0800 
Message-ID: <51DCCD6D.5050807@cn.fujitsu.com>
Date: Wed, 10 Jul 2013 10:56:45 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51DBC97F.1090606@cn.fujitsu.com>
In-Reply-To: <51DBC97F.1090606@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/10 10:55:02,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/10 10:55:02,
	Serialize complete at 2013/07/10 10:55:02
Subject: Re: [PATCH 0/1]package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm
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
X-List-Received-Date: Wed, 10 Jul 2013 02:56:49 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Hi all

Sorry, it looks like i should post this patch to poky. please ignore this

Thanks
 Bian

said the following on 2013-7-9 16:27:, Bian Naimeng wrote:
> If the spec file already exist, and has not been stored into pseudo's files.db,
> it maybe cause rpmbuild src.rpm fail, so remove it before doing rpmbuild src.rpm.
> 
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> 
> ---
>  meta/classes/package_rpm.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index c654cdb..217ddcb 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -1069,8 +1069,13 @@ python do_package_rpm () {
>          return
>  
>      # Construct the spec file...
> +    # If the spec file already exist, and has not been stored into 
> +    # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
> +    # so remove it before doing rpmbuild src.rpm.
>      srcname    = strip_multilib(d.getVar('PN', True), d)
>      outspecfile = workdir + "/" + srcname + ".spec"
> +    if os.path.isfile(outspecfile):
> +        os.remove(outspecfile)
>      d.setVar('OUTSPECFILE', outspecfile)
>      bb.build.exec_func('write_specfile', d)


