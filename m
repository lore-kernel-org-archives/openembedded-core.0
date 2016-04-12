Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 337FE605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:02:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Apr 2016 04:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,473,1455004800"; d="scan'208";a="953222710"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.24.167])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2016 04:02:21 -0700
Message-ID: <1460458938.3309.7.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 12:02:18 +0100
In-Reply-To: <1460092326-34326-1-git-send-email-sona.sarmadi@enea.com>
References: <1460092326-34326-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] bind: CVE-2016-1285 CVE-2016-1286
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
X-List-Received-Date: Tue, 12 Apr 2016 11:02:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-04-08 at 07:12 +0200, Sona Sarmadi wrote:
> CVE-2016-1285 bind: malformed packet sent to rndc can trigger
> assertion failure
> CVE-2016-1286 bind: malformed signature records for DNAME records can
> trigger assertion failure

Unfortunately I can't build bind with this patch applied:

| cc.c: In function 'verify':  
| cc.c:293:27: error: 'hmac' undeclared (first use in this function)  
|   if (!isccc_sexpr_binaryp(hmac))  
|                            ^  
| cc.c:293:27: note: each undeclared identifier is reported only once
for each function it appears in  
| make[2]: *** [cc.o] Error 1

Based on a quick skim read of the patches I think this is caused
by CVE-2016-1285.patch:

<snip>

> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch

<snip>

> +diff --git a/lib/isccc/cc.c b/lib/isccc/cc.c
> +index 9915568..ffcd584 100644
> +--- a/lib/isccc/cc.c
> ++++ b/lib/isccc/cc.c
> +@@ -284,10 +284,10 @@ verify(isccc_sexpr_t *alist, unsigned char
> *data, unsigned int length,
> + 	 * Extract digest.
> + 	 */
> + 	_auth = isccc_alist_lookup(alist, "_auth");
> +-	if (_auth == NULL)
> ++	if (!isccc_alist_alistp(_auth))
> + 		return (ISC_R_FAILURE);
> + 	hmd5 = isccc_alist_lookup(_auth, "hmd5");
> +-	if (hmd5 == NULL)
> ++	if (!isccc_sexpr_binaryp(hmac))

I believe this is the root of the compilation error. Should this be:

if (!isccc_sexpr_binaryp(hmd5))

?

<snip>

Regards,

Joshua

