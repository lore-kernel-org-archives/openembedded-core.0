Return-Path: <gchoc-openembedded-core@m.gmane-mx.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8186C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 21:14:03 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by mx.groups.io with SMTP id smtpd.web09.2257.1647292442396917404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 14:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: m.gmane-mx.org, ip: 116.202.254.214,
 mailfrom: gchoc-openembedded-core@m.gmane-mx.org)
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <gchoc-openembedded-core@m.gmane-mx.org>)
	id 1nTs0q-0000vW-Ng
	for openembedded-core@lists.openembedded.org; Mon, 14 Mar 2022 22:13:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH 20/20] perf: sort-pmuevents: allow for additional type
 qualifiers and storage class
Date: Mon, 14 Mar 2022 22:13:49 +0100
Message-ID: <b8559718-7155-285f-d49b-f3102d6e74aa@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
 <487361c5d91ff9389454f1ef3577038a9878e116.1637788184.git.bruce.ashfield@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@public.gmane.org,
 TicoTimo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 trevor.gamblin-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org
Content-Language: en-US
In-Reply-To: 
 <487361c5d91ff9389454f1ef3577038a9878e116.1637788184.git.bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 21:14:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163165

Hi,

Op 24-11-2021 om 22:14 schreef Bruce Ashfield:
> From: Max Krummenacher <max.oss.09@gmail.com>
> 
> With kernel 5.16 some structs in pmu-events do get a const qualifier, some
> a static const storage class and qualifier.
> 
> The current sort-pmuevents cannot cope with that and drops all struct
> arrays with such additional elements. This then leads to compiler errors.
> 
> Allow '^struct', '^const struct', '^static struct', '^static const struct'.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   .../perf/perf/sort-pmuevents.py               | 30 ++++++++++---------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
> index 4f841eb822..09ba3328a7 100755
> --- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
> +++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
> @@ -33,10 +33,10 @@ if os.path.exists(outfile):
>   with open(infile, 'r') as file:
>       data = file.read()
>   
> -preamble_regex = re.compile( '^(.*?)^struct', re.MULTILINE | re.DOTALL )
> +preamble_regex = re.compile( '^(.*?)^(struct|const struct|static struct|static const struct)', re.MULTILINE | re.DOTALL )
>   
>   preamble = re.search( preamble_regex, data )
> -struct_block_regex = re.compile( '^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
> +struct_block_regex = re.compile( '^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
>   field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
>   cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
>   name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
> @@ -45,24 +45,25 @@ name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
>   # types and then their fields.
>   entry_dict = {}
>   for struct in re.findall( struct_block_regex, data ):
> -    # print( "struct: %s %s" % (struct[0],struct[1]) )
> -    entry_dict[struct[1]] = {}
> -    entry_dict[struct[1]]['type'] = struct[0]
> -    entry_dict[struct[1]]['fields'] = {}
> -    for entry in re.findall( field_regex, struct[2] ):
> +    # print( "struct: %s %s %s" % (struct[0],struct[1],struct[2]) )
> +    entry_dict[struct[2]] = {}
> +    entry_dict[struct[2]]['type_prefix'] = struct[0]
> +    entry_dict[struct[2]]['type'] = struct[1]
> +    entry_dict[struct[2]]['fields'] = {}
> +    for entry in re.findall( field_regex, struct[3] ):
>           #print( "    entry: %s" % entry )
>           cpuid = re.search( cpuid_regex, entry )
>           if cpuid:
>               #print( "    cpuid found: %s" % cpuid.group(1) )
> -            entry_dict[struct[1]]['fields'][cpuid.group(1)] = entry
> -
> +            entry_dict[struct[2]]['fields'][cpuid.group(1)] = entry
> +
>           name = re.search( name_regex, entry )
>           if name:
>               #print( "    name found: %s" % name.group(1) )
> -            entry_dict[struct[1]]['fields'][name.group(1)] = entry
> -
> -        if not entry_dict[struct[1]]['fields']:
> -            entry_dict[struct[1]]['fields']['0'] = entry
> +            entry_dict[struct[2]]['fields'][name.group(1)] = entry
> +
> +        if not entry_dict[struct[2]]['fields']:
> +            entry_dict[struct[2]]['fields']['0'] = entry
>   
>   # created ordered dictionaries from the captured values. These are ordered by
>   # a sorted() iteration of the keys. We don't care about the order we read
> @@ -74,6 +75,7 @@ for struct in re.findall( struct_block_regex, data ):
>   entry_dict_sorted = OrderedDict()
>   for i in sorted(entry_dict.keys()):
>       entry_dict_sorted[i] = {}
> +    entry_dict_sorted[i]['type_prefix'] = entry_dict[i]['type_prefix']
>       entry_dict_sorted[i]['type'] = entry_dict[i]['type']
>       entry_dict_sorted[i]['fields'] = {}
>       for f in sorted(entry_dict[i]['fields'].keys()):
> @@ -85,7 +87,7 @@ outf = open( outfile, 'w' )
>   print( preamble.group(1) )
>   outf.write( preamble.group(1) )
>   for d in entry_dict_sorted:
> -    outf.write( "struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d) )
> +    outf.write( "%s %s %s[] = {\n" % (entry_dict_sorted[d]['type_prefix'], entry_dict_sorted[d]['type'],d) )
>       for f in entry_dict_sorted[d]['fields']:
>           outf.write( entry_dict_sorted[d]['fields'][f] + '\n' )
>   
I have had sort-pmuevents hanging since on hardknott trying to build 
linux 5.16 and disabled perf from my recipe to work around.

However, I was hoping that with honister this patch would resolve that 
issue. But it doesn't in my case.

Is there anything in particular that I need to do to make this work?

Thanks
Ferry
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158766): https://lists.openembedded.org/g/openembedded-core/message/158766
> Mute This Topic: https://lists.openembedded.org/mt/87290477/4454657
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [gchoc-openembedded-core@m.gmane-mx.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



