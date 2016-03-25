Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 17F4F6FF30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 21:07:17 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id c67so34867286qgc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 14:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=umqbzzVpHOF1oY9YYMmBvmVgjWfVeMD9B9ZpQT7kfHI=;
	b=AEpocaWjS0Pq4NQBAorki2lDAAy5Ebd3SZfpYMQbn6mIcaxlmr0nvVQ9SFopNJvXRx
	KHinBSKWWPIzXVNQg25OHm04ddzr5ohjzazcPnBEXfknbJUUl/rvLOGSplghvR7ro6ML
	rzwvA03ssjVl2IxqkE63cJEe6AXzehYOhdzSJpe6Sj8mPjDAv9HkvFcfIeXEvwPSsweO
	WGYBjumP4L42e/hKRNsYohIRXteaXjj1ilkpP59Cxsm5M7Vw7udM+Ahb62/pc953vQuE
	QEx4Pw0De70ELLJyrUCypJ6f6WX7ryY1FizHD129Y81tHdhvrbgiStYZbqz2HxQlC+uZ
	O4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=umqbzzVpHOF1oY9YYMmBvmVgjWfVeMD9B9ZpQT7kfHI=;
	b=PNHhnt3h/znLtv0wvmqH0zPodFwjfuublO2xmzHYM99YA+tfXJjGCLTaxHGnGa/WNc
	IWLc0L78llqm6pT0l2Sy+QyXoJdYKqIYiMKQOafs/77/6L6pXkEXlRESCecf5uMKbyO5
	knJncOqD8MU0+D0+ndX3ZgA3mKQHeonbViXfGDYGtDecCq9ca88EiAatXj+8TulC6soH
	zRE7mnLc9Msjk//cmzBN/YmPtOQHOucx1zeU1CghIbo/4WpCpUhUwzyGjTCrmBfpOM1E
	UlveQx4DjjQ89HYahoXOuV/0y0s7N+4qDJJZ+tcw6cdJIx3PXsmrTImOobo0i6rH+bgd
	IhfQ==
X-Gm-Message-State: AD7BkJJnGoM6mjRrKWnmUthfKkt98AnO0Ut9/5aq/DQsy2peIQOiYkmAn9jLNeiemUy18g==
X-Received: by 10.140.87.98 with SMTP id q89mr2615167qgd.8.1458940038202;
	Fri, 25 Mar 2016 14:07:18 -0700 (PDT)
Received: from [192.168.1.139] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	z65sm6067797qhb.36.2016.03.25.14.07.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2016 14:07:16 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <56F59D2B.2010108@gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <56F5A883.5040306@gmail.com>
Date: Fri, 25 Mar 2016 17:07:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56F59D2B.2010108@gmail.com>
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Fri, 25 Mar 2016 21:07:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This change gets things parsing again, but still testing to see if it does what
I want it to do:

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 9bd87ad..fb44fdc 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -358,7 +358,7 @@ class Git(FetchMethod):
         """
         output = self._lsremote(ud, d, "")
         # Tags of the form ^{} may not work, need to fallback to other form
-        if ud.unresolvedrev[name][:5] == "refs/":
+        if ud.unresolvedrev[name][:5] == "refs/" or ud.unresolvedrev[name] ==
"HEAD":
             head = ud.unresolvedrev[name]
             tag = ud.unresolvedrev[name]
         else:

Cliff

On 03/25/2016 04:18 PM, Cliff Brake wrote:
> Hi,
>
> In the past (say Dora era), I've used externalsrc like:
>
> ====================
> DESCRIPTION = "MyApp"
> LICENSE = "CLOSED"
>
> inherit externalsrc
>
> SRCREV = "${AUTOREV}"
> PV = "1.4+gitr${SRCPV}"
> PR = "r1"
>
> SRC_URI = "git://${FILE_DIRNAME};protocol=file;branch=HEAD"
> S = "${FILE_DIRNAME}"
>
> ...
> ====================
>
> This was very nice in that it set SRCPV to to the git version of the HEAD of my
> local workspace.  When building from a local git workspace, this makes sense to
> me -- I want the Git version of the workspace, not a remote version.
>
> Now with Jethro, I get errors like:
>
> ERROR: ExpansionError during parsing myapp.bb: Failure expanding variable SRCPV,
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
> Fetcher failure: Unable to resolve 'HEAD' in upstream git repository in git
> ls-remote output for /scratch/externalsrc/MyApp
>
> Do you have any suggestions how to use externalsrc + a local git workspace and
> avoid the above error.  I can set branch=master, etc and bitbake will then parse
> it, but the remote master version is not really what I'm building.
>
> Thanks,
> Cliff
>


