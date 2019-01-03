Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 25A8B6B180
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 12:24:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so33434782wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JmLoi3G5t2t05aUvQx+rUEJfOC7igkwO7n07IknIAaU=;
	b=cDuHFNaz7WMcS4Q4r3Pn9Ez+2dDmR6O73FrDs9PX7pF0UWTinoKe3s5DAZld8QSuXZ
	AO/hKU5Gn51/UDuBHM+NwSVrqvvB/WG9vTbJRPPGdkLOqpfXVdE2z0A1kRaG8BwYOjTf
	AqFmBOzE7tMsp2jHgMoTwfmCkHy6jwy8jy73g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JmLoi3G5t2t05aUvQx+rUEJfOC7igkwO7n07IknIAaU=;
	b=BMXUPDODHRTBot+vva3258MJRRtN0VT6ADAStNY3E3bw3lH/MAu1xpxar3l3GVMaLZ
	2I7WvDLomlPzkfxElMJs8Lp9xo+cqa0G42XnGY149wBrLNJ1pbS6f+ZmzaUJEJmTpjfd
	qFMDpXmj25UkLeT3y1U+UCGIO2edbTUcpk+P+lx7np+l3SkhzunhjMJEr1V4Tbu7j3W4
	jJHplZA+kquz1CxZLMLFgCrV88MGwF6Pkks5BvlmDIx3LfSzw8rjzgHp8xd3d+mo7aU+
	pCOp0umhjXr85Rg0+Cz14cR5HZHRSaT6WridogyKqXwKVbWqT6F8AVdPcc6HaBpS4phG
	+4Gg==
X-Gm-Message-State: AJcUukcX8qiwVfukoJqf47y9e1niJgBJnvD4MflxBxAEMLgm43WxsFd1
	xIAZYFC2z/xU0kSDeU14EmMX74XdseyZoQ==
X-Google-Smtp-Source: ALg8bN6WR2UxSsa7baL9HQJPLAMHTzLsru18xrEjIsCIAGNDD0tOwd2KW+S2BFOgO9n/f2UKPdUrcw==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr14058310wro.208.1546518250662; 
	Thu, 03 Jan 2019 04:24:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a187sm40768274wmf.33.2019.01.03.04.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 04:24:09 -0800 (PST)
Message-ID: <a451606a02f11b5f6e5675ca75e003ff0a4cd1b2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Jan 2019 12:24:08 +0000
In-Reply-To: <1546500195-57586-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1546500195-57586-1-git-send-email-ee.peng.yeoh@intel.com>
	<1546500195-57586-2-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3 v2] scripts/oe-git-archive: fix non-existent key referencing error
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
X-List-Received-Date: Thu, 03 Jan 2019 12:24:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-03 at 15:23 +0800, Yeoh Ee Peng wrote:
> Without installing gitpython package, oe-git-archive will face error
> below, where it was referencing key that was non-existent inside
> metadata object.
> 
> Traceback (most recent call last):
>   File "<poky_dir>/scripts/oe-git-archive", line 271, in <module>
>     sys.exit(main())
>   File "<poky_dir>/scripts/oe-git-archive", line 229, in main
>     'commit_count': metadata['layers']['meta']['commit_count'],
> KeyError: 'commit_count'
> 
> Fix this error by checking the key existent from metadata before
> referencing it.
> 
> [YOCTO# 13082]
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  scripts/oe-git-archive | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
> index ab19cb9..80c2379 100755
> --- a/scripts/oe-git-archive
> +++ b/scripts/oe-git-archive
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>  #
>  # Helper script for committing data to git and pushing upstream
>  #
> @@ -208,6 +208,18 @@ def parse_args(argv):
>                          help="Data to commit")
>      return parser.parse_args(argv)
>  
> +def _get_metadata_value(metadata, keys):
> +    if len(keys) > 0:
> +        key = keys.pop(0)
> +        if key in metadata:
> +            if len(keys) == 0:
> +                return metadata[key]
> +            else:
> +                return _get_metadata_value(metadata[key], keys)
> +        else:
> +            return ""
> +    else:
> +        return ""

This isn't very pythonic unfortunately. You can do "if X:" instead of
"if len(X)" or "if len(X) > 0:". You can also remove the else: return
"" and just put return "" at the end of the function.

I also think the recursion here is hard to understand and python has a
better way of handling this, python tends to work on the "forgiveness"
rather than "permission" approach to code. By that I mean:

try:
    return metadata[key]
except KeyError:
    return ""

is more "pythonic" than:

if key in metadata:
    return metadata[key]
else:
    return ""

(for dicts you can also do metadata.get(key, "") )

>  def main(argv=None):
>      """Script entry point"""
> @@ -223,11 +235,15 @@ def main(argv=None):
>  
>          # Get keywords to be used in tag and branch names and
> messages
>          metadata = metadata_from_bb()
> -        keywords = {'hostname': metadata['hostname'],
> -                    'branch': metadata['layers']['meta']['branch'],
> -                    'commit': metadata['layers']['meta']['commit'],
> -                    'commit_count':
> metadata['layers']['meta']['commit_count'],
> -                    'machine': metadata['config']['MACHINE']}
> +        keywords_map = {'hostname': ['hostname'],
> +                        'branch': ['layers', 'meta', 'branch'],
> +                        'commit': ['layers', 'meta', 'commit'],
> +                        'commit_count': ['layers', 'meta',
> 'commit_count'],
> +                        'machine': ['config', 'MACHINE']}
> +        keywords = {}
> +        for map_key in keywords_map.keys():
> +            keywords_value = _get_metadata_value(metadata,
> keywords_map[map_key])
> +            keywords[map_key] = keywords_value
>  
>          # Expand strings early in order to avoid getting into
> inconsistent
>          # state (e.g. no tag even if data was committed)


How about something like:

def get_nested(d, list_of_keys):
    try:
        for k in list_of_keys:
            d = d[k]
        return d
    except KeyError:
        return ""

keywords = {'hostname': get_nested(metadata, ['hostname']),
            'branch': get_nested(metadata, ['layers', 'meta', 'branch']),
            'commit': get_nested(metadata, ['layers', 'meta', 'commit']),
            'commit_count': get_nested(metadata, ['layers', 'meta', 'commit_count']),
            'machine': get_nested(metadata, ['config', 'MACHINE'])}

Cheers,

Richard


