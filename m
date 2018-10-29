Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 77F2A79B89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 17:02:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9TH2osR011544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Oct 2018 17:02:51 GMT
Message-ID: <669e9c7aa51f8cf3d856567300ffd92a650c7716.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, grygorii tertychnyi
	<gtertych@cisco.com>, openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 17:02:50 +0000
In-Reply-To: <62100e44-8bad-1eb4-1702-58ec0e9b94d8@gmail.com>
References: <20181029151310.18527-1-gtertych@cisco.com>
	<62100e44-8bad-1eb4-1702-58ec0e9b94d8@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH] curl: extend CVE_PRODUCT
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
X-List-Received-Date: Mon, 29 Oct 2018 17:02:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-29 at 15:46 +0000, akuster808 wrote:
> On 10/29/18 3:13 PM, grygorii tertychnyi via Openembedded-core wrote:
> > There are both "curl" and "libcurl" CPEs in NVD.
> > All "curl" CVEs are now missed in the reports.
> > 
> > Hence, switch "CVE_PRODUCT" to a space separated list.
> > It is useful for recipes generating several packages,
> > that have different product names in NVD.
> > 
> > Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> > ---
> >  meta/classes/cve-check.bbclass           | 3 ++-
> >  meta/recipes-support/curl/curl_7.61.0.bb | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
> > check.bbclass
> > index 12ad3e5c5c..743bc08a4f 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -190,7 +190,8 @@ def check_cves(d, patched_cves):
> >          # Write the faux CSV file to be used with cve-check-tool
> >          fd, faux = tempfile.mkstemp(prefix="cve-faux-")
> >          with os.fdopen(fd, "w") as f:
> > -            f.write("%s,%s,%s," % (bpn, pv, cves))
> > +            for pn in bpn.split():
> > +                f.write("%s,%s,%s,\n" % (pn, pv, cves))
> >          cmd.append(faux)
> 
> 
> Please split this patch into two parts.  the appear to be
> independent.

Since we need to get 2.6 built I've split this up.

Cheers,

Richard


