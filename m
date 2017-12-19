Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E662377F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 01:31:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBJ1V2Tw023937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:31:02 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 18 Dec 2017 17:31:01 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1510727871.git.Qi.Chen@windriver.com>
	<60531f0490ca7243878533d4150c0dee1e64fc5f.1510727871.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <145aa3d7-099a-c3fa-5409-9da7e263d919@windriver.com>
Date: Tue, 19 Dec 2017 09:32:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <60531f0490ca7243878533d4150c0dee1e64fc5f.1510727871.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 1/1] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
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
X-List-Received-Date: Tue, 19 Dec 2017 01:31:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Could someone help review this patch?

Thanks,
Chen Qi

On 11/15/2017 02:38 PM, Chen Qi wrote:
> Add ESDK_MANIFEST_EXCLUDES to enable excluding items from sdk-conf-manifest.
>
> By default, files under conf/ are all added to sdk-conf-manifest, as the
> manifest file is set to 'conf/*'.
>
> However, there are situations where some configuration files under conf/
> directory are not intended to be added to sdk-conf-manifest, thus adding
> ESDK_MANIFEST_EXCLUDES to enable users to do this.
>
> This variable takes the form of glob matching.
> e.g.
> ESDK_MANIFEST_EXCLUDES = "conf/autogen*"
> This would exclude all files under conf/ starting with 'autogen' from
> sdk-conf-manifest.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/populate_sdk_ext.bbclass | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index 3620995..9ced3fc 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -485,12 +485,18 @@ python copy_buildsystem () {
>       # sdk_ext_postinst() below) thus the checksum we take here would always
>       # be different.
>       manifest_file_list = ['conf/*']
> +    esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
> +    esdk_manifest_excludes_list = []
> +    for exclude_item in esdk_manifest_excludes:
> +        esdk_manifest_excludes_list += glob.glob(os.path.join(baseoutpath, exclude_item))
>       manifest_file = os.path.join(baseoutpath, 'conf', 'sdk-conf-manifest')
>       with open(manifest_file, 'w') as f:
>           for item in manifest_file_list:
>               for fn in glob.glob(os.path.join(baseoutpath, item)):
>                   if fn == manifest_file:
>                       continue
> +                if fn in esdk_manifest_excludes_list:
> +                    continue
>                   chksum = bb.utils.sha256_file(fn)
>                   f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
>   }



