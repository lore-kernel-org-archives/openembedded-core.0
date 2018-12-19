Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49FAA6BDFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 01:56:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBJ1tp2J010321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:56:01 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Dec 2018 17:55:41 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1544100963.git.kai.kang@windriver.com>
	<226bbb49f1868d91cb552ce0ad3fe8ee3bf26f04.1544100963.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <298fa30d-5c84-f819-90e7-a251dd8bfb73@windriver.com>
Date: Wed, 19 Dec 2018 09:53:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <226bbb49f1868d91cb552ce0ad3fe8ee3bf26f04.1544100963.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] distro_features_check.bbclass: show all error info at one time
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
X-List-Received-Date: Wed, 19 Dec 2018 01:56:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/12/6 下午9:41, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> In distro_features_check.bbclass it checks whether items in
> REQUIRED_DISTRO_FEATURES and CONFLICT_DISTRO_FEATURES exist in
> DISTRO_FEATURES. But it only shows one required or conflict distro
> feature when error occurs. Update to show them all at one time.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/classes/distro_features_check.bbclass | 29 +++++++++-------------
>   1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
> index 9b78b03ef6..eeaa3b44cb 100644
> --- a/meta/classes/distro_features_check.bbclass
> +++ b/meta/classes/distro_features_check.bbclass
> @@ -11,27 +11,22 @@
>   
>   python () {
>       # Assume at least one var is set.
> -    distro_features = (d.getVar('DISTRO_FEATURES') or "").split()
> +    distro_features = set((d.getVar('DISTRO_FEATURES') or '').split())
>   
> -    any_of_distro_features = d.getVar('ANY_OF_DISTRO_FEATURES')
> +    any_of_distro_features = set((d.getVar('ANY_OF_DISTRO_FEATURES') or '').split())
>       if any_of_distro_features:
> -        any_of_distro_features = any_of_distro_features.split()
> -        if set.isdisjoint(set(any_of_distro_features),set(distro_features)):
> -            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % any_of_distro_features)
> +        if set.isdisjoint(any_of_distro_features, distro_features):
> +            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % ' '.join(any_of_distro_features))
>   
> -    required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES')
> +    required_distro_features = set((d.getVar('REQUIRED_DISTRO_FEATURES') or '').split())
>       if required_distro_features:
> -        required_distro_features = required_distro_features.split()
> -        for f in required_distro_features:
> -            if f in distro_features:
> -                continue
> -            else:
> -                raise bb.parse.SkipRecipe("missing required distro feature '%s' (not in DISTRO_FEATURES)" % f)
> +        missing = set.difference(required_distro_features, distro_features)
> +        if missing:
> +            raise bb.parse.SkipRecipe("missing required distro feature%s '%s' (not in DISTRO_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
>   
> -    conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES')
> +    conflict_distro_features = set((d.getVar('CONFLICT_DISTRO_FEATURES') or '').split())
>       if conflict_distro_features:
> -        conflict_distro_features = conflict_distro_features.split()
> -        for f in conflict_distro_features:
> -            if f in distro_features:
> -                raise bb.parse.SkipRecipe("conflicting distro feature '%s' (in DISTRO_FEATURES)" % f)
> +        conflicts = set.intersection(conflict_distro_features, distro_features)
> +        if conflicts:
> +            raise bb.parse.SkipRecipe("conflicting distro feature%s '%s' (in DISTRO_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
>   }

Any comment on this patch? Thanks.

-- 
Kai Kang


