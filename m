Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 416546025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:32:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0MGWtt1000322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 08:32:55 -0800
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 22 Jan 2018 08:32:54 -0800
To: <openembedded-core@lists.openembedded.org>
References: <20180122154442.23769-1-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <88adb573-a7be-6da8-38d7-b160acb4716c@windriver.com>
Date: Mon, 22 Jan 2018 10:32:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180122154442.23769-1-ross.burton@intel.com>
Subject: Re: [PATCH] package_rpm: correctly handle LICENSE_${PN}
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
X-List-Received-Date: Mon, 22 Jan 2018 16:32:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/22/18 9:44 AM, Ross Burton wrote:
> RPM spec files don't distinguish between spec-level license and the primary
> package license, so always output the License for every package (defaulting to
> the recipe-wide license) and use LICENSE_${PN} if set for the primary package.
> 
> As the primary use of package_rpm is to generate built packages, this fixes the
> license fields in the generated packages.
> 
> [ YOCTO #12057 ]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index b08608c8466..3cbbd1eb537 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -382,6 +382,7 @@ python write_specfile () {

For the specific problem reported, this is correct.  However, it has an
unintended side effect.  When the archiver is enabled (with SRPM support), it
uses the same function to generate the SRPM files.  This will result in the SRPM
not having the 'correct' "source code" license, but instead will end up having
the license of the first package.

At a minimum, we should detect this case and warn someone..  I.e.

>  
>          # Gather special src/first package data
>          if srcname == splitname:

if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and \
   bb.data.inherits_class('archiver', d) and \
   srclicense != splitlicense:
	bb.warn("The SRPM produced may not have the correct overall source license in
the LICENSE tag.  This is due to the LICENSE for the primary package and SRPM
conflicting.)

> +            srclicense     = splitlicense
>              srcrdepends    = splitrdepends
>              srcrrecommends = splitrrecommends
>              srcrsuggests   = splitrsuggests

An alternative (i -really- do not like) is to name the overall first entry as
something like:

${PN}-archiver (or src, srpm, ... etc ...)

Then in the later section add ${PN} as the first %package.  I do suspect this
will break some people's validation scripting though.  So there does not appear
to be a clear answer how to deal with this.  (The behavior unfortunately does
not appear to be allowed in upstream RPM.)

> @@ -421,8 +422,7 @@ python write_specfile () {

This hunk is absolutely correct in all cases.

>              spec_preamble_bottom.append('Release: %s' % splitrelease)
>          if srcepoch != splitepoch:
>              spec_preamble_bottom.append('Epoch: %s' % splitepoch)
> -        if srclicense != splitlicense:
> -            spec_preamble_bottom.append('License: %s' % splitlicense)
> +        spec_preamble_bottom.append('License: %s' % splitlicense)
>          spec_preamble_bottom.append('Group: %s' % splitsection)
>  
>          if srccustomtagschunk != splitcustomtagschunk:
> 


