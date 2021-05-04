Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3720.1620090687638051556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 18:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D2AA40C1E;
	Tue,  4 May 2021 01:11:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrKqz4ao0rFp; Tue,  4 May 2021 01:11:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D99ED40A28;
	Tue,  4 May 2021 01:11:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 994121745DB; Mon,  3 May 2021 21:11:24 -0400 (EDT)
Date: Mon, 3 May 2021 21:11:24 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] cml1.bbclass: Return sorted list of cfg files
Message-ID: <20210504011124.GM21867@denix.org>
References: <20210503063600.1595267-1-raj.khem@gmail.com>
 <AM9PR09MB4642187F03FA1776B00F4688A85B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB4642187F03FA1776B00F4688A85B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 03, 2021 at 08:57:02AM +0200, Konrad Weihmann wrote:
> On 03.05.21 08:36, Khem Raj wrote:
> >Since these files are passed to merge_config.sh its better to use a
> >sorted list, so we can be sure that this list is always fed in same
> >order irrespective of python versions on host
> >
> >Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >---
> >  meta/classes/cml1.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> >index d319d66ab2..1c3d70b48d 100644
> >--- a/meta/classes/cml1.bbclass
> >+++ b/meta/classes/cml1.bbclass
> >@@ -6,7 +6,7 @@ def find_cfgs(d):
> >          if s.endswith('.cfg'):
> >              sources_list.append(s)
> >-    return sources_list
> >+    return sorted(sources_list)
> 
> Just as a thought, wouldn't it be better to have the ordering
> defined based on recipe/layer meta data?
> 
> Previously ordering was more or less based on the inode number of
> the files - now it's alphabetically.
> 
> I know that config fragments should be self containing, but seen
> enough real world examples where that isn't the case, so for them
> this might cause a breaking change (tbf the behavior before wasn't
> fully deterministic as well)

Correct, config fragments can come from different places and it's quite 
common for latter fragments to amend some former fragments in the list. 
So, sorting them either way would sure enhance determinism, but surely 
break a lot of existing functionality out there...


> But this issue isn't limited to this particular piece of code here
> and might need some more general solution.
> 
> >  cml1_do_configure() {
> >  	set -e
> >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
