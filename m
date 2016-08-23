Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0DE731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 06:36:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N6arAw005562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Aug 2016 23:36:54 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 23:36:53 -0700
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <1471933853-30716-1-git-send-email-mike.looijmans@topic.nl>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0d8874c9-6b0e-1ccd-9940-898efff67508@windriver.com>
Date: Tue, 23 Aug 2016 14:36:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471933853-30716-1-git-send-email-mike.looijmans@topic.nl>
Subject: Re: [PATCH] lib/bb/siggen.py: Prevent ResourceWarning exceptions
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
X-List-Received-Date: Tue, 23 Aug 2016 06:36:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mike,

It should go into bitbake-devel@lists.openembedded.org

// Robert

On 08/23/2016 02:30 PM, Mike Looijmans wrote:
> Add a "with" statement to explicitly close files. This prevents hundreds of
> "ResourceWarning: unclosed file" outputs.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  lib/bb/siggen.py | 309 ++++++++++++++++++++++++++++---------------------------
>  1 file changed, 155 insertions(+), 154 deletions(-)
>
> diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
> index db3daef..467e07a 100644
> --- a/lib/bb/siggen.py
> +++ b/lib/bb/siggen.py
> @@ -363,167 +363,168 @@ def clean_basepaths_list(a):
>  def compare_sigfiles(a, b, recursecb = None):
>      output = []
>
> -    p1 = pickle.Unpickler(open(a, "rb"))
> -    a_data = p1.load()
> -    p2 = pickle.Unpickler(open(b, "rb"))
> -    b_data = p2.load()
> -
> -    def dict_diff(a, b, whitelist=set()):
> -        sa = set(a.keys())
> -        sb = set(b.keys())
> -        common = sa & sb
> -        changed = set()
> -        for i in common:
> -            if a[i] != b[i] and i not in whitelist:
> -                changed.add(i)
> -        added = sb - sa
> -        removed = sa - sb
> -        return changed, added, removed
> -
> -    def file_checksums_diff(a, b):
> -        from collections import Counter
> -        # Handle old siginfo format
> -        if isinstance(a, dict):
> -            a = [(os.path.basename(f), cs) for f, cs in a.items()]
> -        if isinstance(b, dict):
> -            b = [(os.path.basename(f), cs) for f, cs in b.items()]
> -        # Compare lists, ensuring we can handle duplicate filenames if they exist
> -        removedcount = Counter(a)
> -        removedcount.subtract(b)
> -        addedcount = Counter(b)
> -        addedcount.subtract(a)
> -        added = []
> -        for x in b:
> -            if addedcount[x] > 0:
> -                addedcount[x] -= 1
> -                added.append(x)
> -        removed = []
> -        changed = []
> -        for x in a:
> -            if removedcount[x] > 0:
> -                removedcount[x] -= 1
> -                for y in added:
> -                    if y[0] == x[0]:
> -                        changed.append((x[0], x[1], y[1]))
> -                        added.remove(y)
> -                        break
> -                else:
> -                    removed.append(x)
> -        added = [x[0] for x in added]
> -        removed = [x[0] for x in removed]
> -        return changed, added, removed
> -
> -    if 'basewhitelist' in a_data and a_data['basewhitelist'] != b_data['basewhitelist']:
> -        output.append("basewhitelist changed from '%s' to '%s'" % (a_data['basewhitelist'], b_data['basewhitelist']))
> -        if a_data['basewhitelist'] and b_data['basewhitelist']:
> -            output.append("changed items: %s" % a_data['basewhitelist'].symmetric_difference(b_data['basewhitelist']))
> -
> -    if 'taskwhitelist' in a_data and a_data['taskwhitelist'] != b_data['taskwhitelist']:
> -        output.append("taskwhitelist changed from '%s' to '%s'" % (a_data['taskwhitelist'], b_data['taskwhitelist']))
> -        if a_data['taskwhitelist'] and b_data['taskwhitelist']:
> -            output.append("changed items: %s" % a_data['taskwhitelist'].symmetric_difference(b_data['taskwhitelist']))
> -
> -    if a_data['taskdeps'] != b_data['taskdeps']:
> -        output.append("Task dependencies changed from:\n%s\nto:\n%s" % (sorted(a_data['taskdeps']), sorted(b_data['taskdeps'])))
> -
> -    if a_data['basehash'] != b_data['basehash']:
> -        output.append("basehash changed from %s to %s" % (a_data['basehash'], b_data['basehash']))
> -
> -    changed, added, removed = dict_diff(a_data['gendeps'], b_data['gendeps'], a_data['basewhitelist'] & b_data['basewhitelist'])
> -    if changed:
> -        for dep in changed:
> -            output.append("List of dependencies for variable %s changed from '%s' to '%s'" % (dep, a_data['gendeps'][dep], b_data['gendeps'][dep]))
> -            if a_data['gendeps'][dep] and b_data['gendeps'][dep]:
> -                output.append("changed items: %s" % a_data['gendeps'][dep].symmetric_difference(b_data['gendeps'][dep]))
> -    if added:
> -        for dep in added:
> -            output.append("Dependency on variable %s was added" % (dep))
> -    if removed:
> -        for dep in removed:
> -            output.append("Dependency on Variable %s was removed" % (dep))
> -
> -
> -    changed, added, removed = dict_diff(a_data['varvals'], b_data['varvals'])
> -    if changed:
> -        for dep in changed:
> -            output.append("Variable %s value changed from '%s' to '%s'" % (dep, a_data['varvals'][dep], b_data['varvals'][dep]))
> -
> -    if not 'file_checksum_values' in a_data:
> -         a_data['file_checksum_values'] = {}
> -    if not 'file_checksum_values' in b_data:
> -         b_data['file_checksum_values'] = {}
> -
> -    changed, added, removed = file_checksums_diff(a_data['file_checksum_values'], b_data['file_checksum_values'])
> -    if changed:
> -        for f, old, new in changed:
> -            output.append("Checksum for file %s changed from %s to %s" % (f, old, new))
> -    if added:
> -        for f in added:
> -            output.append("Dependency on checksum of file %s was added" % (f))
> -    if removed:
> -        for f in removed:
> -            output.append("Dependency on checksum of file %s was removed" % (f))
> -
> -    if not 'runtaskdeps' in a_data:
> -         a_data['runtaskdeps'] = {}
> -    if not 'runtaskdeps' in b_data:
> -         b_data['runtaskdeps'] = {}
> -
> -    if len(a_data['runtaskdeps']) != len(b_data['runtaskdeps']):
> -        changed = ["Number of task dependencies changed"]
> -    else:
> -        changed = []
> -        for idx, task in enumerate(a_data['runtaskdeps']):
> -            a = a_data['runtaskdeps'][idx]
> -            b = b_data['runtaskdeps'][idx]
> -            if a_data['runtaskhashes'][a] != b_data['runtaskhashes'][b]:
> -                changed.append("%s with hash %s\n changed to\n%s with hash %s" % (a, a_data['runtaskhashes'][a], b, b_data['runtaskhashes'][b]))
> -
> -    if changed:
> -        output.append("runtaskdeps changed from %s to %s" % (clean_basepaths_list(a_data['runtaskdeps']), clean_basepaths_list(b_data['runtaskdeps'])))
> -        output.append("\n".join(changed))
> -
> -
> -    if 'runtaskhashes' in a_data and 'runtaskhashes' in b_data:
> -        a = a_data['runtaskhashes']
> -        b = b_data['runtaskhashes']
> -        changed, added, removed = dict_diff(a, b)
> +    with open(a, "rb") as file_a, open(b, "rb") as file_b:
> +        p1 = pickle.Unpickler(file_a)
> +        a_data = p1.load()
> +        p2 = pickle.Unpickler(file_b)
> +        b_data = p2.load()
> +
> +        def dict_diff(a, b, whitelist=set()):
> +            sa = set(a.keys())
> +            sb = set(b.keys())
> +            common = sa & sb
> +            changed = set()
> +            for i in common:
> +                if a[i] != b[i] and i not in whitelist:
> +                    changed.add(i)
> +            added = sb - sa
> +            removed = sa - sb
> +            return changed, added, removed
> +
> +        def file_checksums_diff(a, b):
> +            from collections import Counter
> +            # Handle old siginfo format
> +            if isinstance(a, dict):
> +                a = [(os.path.basename(f), cs) for f, cs in a.items()]
> +            if isinstance(b, dict):
> +                b = [(os.path.basename(f), cs) for f, cs in b.items()]
> +            # Compare lists, ensuring we can handle duplicate filenames if they exist
> +            removedcount = Counter(a)
> +            removedcount.subtract(b)
> +            addedcount = Counter(b)
> +            addedcount.subtract(a)
> +            added = []
> +            for x in b:
> +                if addedcount[x] > 0:
> +                    addedcount[x] -= 1
> +                    added.append(x)
> +            removed = []
> +            changed = []
> +            for x in a:
> +                if removedcount[x] > 0:
> +                    removedcount[x] -= 1
> +                    for y in added:
> +                        if y[0] == x[0]:
> +                            changed.append((x[0], x[1], y[1]))
> +                            added.remove(y)
> +                            break
> +                    else:
> +                        removed.append(x)
> +            added = [x[0] for x in added]
> +            removed = [x[0] for x in removed]
> +            return changed, added, removed
> +
> +        if 'basewhitelist' in a_data and a_data['basewhitelist'] != b_data['basewhitelist']:
> +            output.append("basewhitelist changed from '%s' to '%s'" % (a_data['basewhitelist'], b_data['basewhitelist']))
> +            if a_data['basewhitelist'] and b_data['basewhitelist']:
> +                output.append("changed items: %s" % a_data['basewhitelist'].symmetric_difference(b_data['basewhitelist']))
> +
> +        if 'taskwhitelist' in a_data and a_data['taskwhitelist'] != b_data['taskwhitelist']:
> +            output.append("taskwhitelist changed from '%s' to '%s'" % (a_data['taskwhitelist'], b_data['taskwhitelist']))
> +            if a_data['taskwhitelist'] and b_data['taskwhitelist']:
> +                output.append("changed items: %s" % a_data['taskwhitelist'].symmetric_difference(b_data['taskwhitelist']))
> +
> +        if a_data['taskdeps'] != b_data['taskdeps']:
> +            output.append("Task dependencies changed from:\n%s\nto:\n%s" % (sorted(a_data['taskdeps']), sorted(b_data['taskdeps'])))
> +
> +        if a_data['basehash'] != b_data['basehash']:
> +            output.append("basehash changed from %s to %s" % (a_data['basehash'], b_data['basehash']))
> +
> +        changed, added, removed = dict_diff(a_data['gendeps'], b_data['gendeps'], a_data['basewhitelist'] & b_data['basewhitelist'])
> +        if changed:
> +            for dep in changed:
> +                output.append("List of dependencies for variable %s changed from '%s' to '%s'" % (dep, a_data['gendeps'][dep], b_data['gendeps'][dep]))
> +                if a_data['gendeps'][dep] and b_data['gendeps'][dep]:
> +                    output.append("changed items: %s" % a_data['gendeps'][dep].symmetric_difference(b_data['gendeps'][dep]))
>          if added:
>              for dep in added:
> -                bdep_found = False
> -                if removed:
> -                    for bdep in removed:
> -                        if b[dep] == a[bdep]:
> -                            #output.append("Dependency on task %s was replaced by %s with same hash" % (dep, bdep))
> -                            bdep_found = True
> -                if not bdep_found:
> -                    output.append("Dependency on task %s was added with hash %s" % (clean_basepath(dep), b[dep]))
> +                output.append("Dependency on variable %s was added" % (dep))
>          if removed:
>              for dep in removed:
> -                adep_found = False
> -                if added:
> -                    for adep in added:
> -                        if b[adep] == a[dep]:
> -                            #output.append("Dependency on task %s was replaced by %s with same hash" % (adep, dep))
> -                            adep_found = True
> -                if not adep_found:
> -                    output.append("Dependency on task %s was removed with hash %s" % (clean_basepath(dep), a[dep]))
> +                output.append("Dependency on Variable %s was removed" % (dep))
> +
> +
> +        changed, added, removed = dict_diff(a_data['varvals'], b_data['varvals'])
>          if changed:
>              for dep in changed:
> -                output.append("Hash for dependent task %s changed from %s to %s" % (clean_basepath(dep), a[dep], b[dep]))
> -                if callable(recursecb):
> -                    # If a dependent hash changed, might as well print the line above and then defer to the changes in
> -                    # that hash since in all likelyhood, they're the same changes this task also saw.
> -                    recout = recursecb(dep, a[dep], b[dep])
> -                    if recout:
> -                        output = [output[-1]] + recout
> -
> -    a_taint = a_data.get('taint', None)
> -    b_taint = b_data.get('taint', None)
> -    if a_taint != b_taint:
> -        output.append("Taint (by forced/invalidated task) changed from %s to %s" % (a_taint, b_taint))
> +                output.append("Variable %s value changed from '%s' to '%s'" % (dep, a_data['varvals'][dep], b_data['varvals'][dep]))
>
> -    return output
> +        if not 'file_checksum_values' in a_data:
> +             a_data['file_checksum_values'] = {}
> +        if not 'file_checksum_values' in b_data:
> +             b_data['file_checksum_values'] = {}
> +
> +        changed, added, removed = file_checksums_diff(a_data['file_checksum_values'], b_data['file_checksum_values'])
> +        if changed:
> +            for f, old, new in changed:
> +                output.append("Checksum for file %s changed from %s to %s" % (f, old, new))
> +        if added:
> +            for f in added:
> +                output.append("Dependency on checksum of file %s was added" % (f))
> +        if removed:
> +            for f in removed:
> +                output.append("Dependency on checksum of file %s was removed" % (f))
> +
> +        if not 'runtaskdeps' in a_data:
> +             a_data['runtaskdeps'] = {}
> +        if not 'runtaskdeps' in b_data:
> +             b_data['runtaskdeps'] = {}
> +
> +        if len(a_data['runtaskdeps']) != len(b_data['runtaskdeps']):
> +            changed = ["Number of task dependencies changed"]
> +        else:
> +            changed = []
> +            for idx, task in enumerate(a_data['runtaskdeps']):
> +                a = a_data['runtaskdeps'][idx]
> +                b = b_data['runtaskdeps'][idx]
> +                if a_data['runtaskhashes'][a] != b_data['runtaskhashes'][b]:
> +                    changed.append("%s with hash %s\n changed to\n%s with hash %s" % (a, a_data['runtaskhashes'][a], b, b_data['runtaskhashes'][b]))
> +
> +        if changed:
> +            output.append("runtaskdeps changed from %s to %s" % (clean_basepaths_list(a_data['runtaskdeps']), clean_basepaths_list(b_data['runtaskdeps'])))
> +            output.append("\n".join(changed))
> +
> +
> +        if 'runtaskhashes' in a_data and 'runtaskhashes' in b_data:
> +            a = a_data['runtaskhashes']
> +            b = b_data['runtaskhashes']
> +            changed, added, removed = dict_diff(a, b)
> +            if added:
> +                for dep in added:
> +                    bdep_found = False
> +                    if removed:
> +                        for bdep in removed:
> +                            if b[dep] == a[bdep]:
> +                                #output.append("Dependency on task %s was replaced by %s with same hash" % (dep, bdep))
> +                                bdep_found = True
> +                    if not bdep_found:
> +                        output.append("Dependency on task %s was added with hash %s" % (clean_basepath(dep), b[dep]))
> +            if removed:
> +                for dep in removed:
> +                    adep_found = False
> +                    if added:
> +                        for adep in added:
> +                            if b[adep] == a[dep]:
> +                                #output.append("Dependency on task %s was replaced by %s with same hash" % (adep, dep))
> +                                adep_found = True
> +                    if not adep_found:
> +                        output.append("Dependency on task %s was removed with hash %s" % (clean_basepath(dep), a[dep]))
> +            if changed:
> +                for dep in changed:
> +                    output.append("Hash for dependent task %s changed from %s to %s" % (clean_basepath(dep), a[dep], b[dep]))
> +                    if callable(recursecb):
> +                        # If a dependent hash changed, might as well print the line above and then defer to the changes in
> +                        # that hash since in all likelyhood, they're the same changes this task also saw.
> +                        recout = recursecb(dep, a[dep], b[dep])
> +                        if recout:
> +                            output = [output[-1]] + recout
> +
> +        a_taint = a_data.get('taint', None)
> +        b_taint = b_data.get('taint', None)
> +        if a_taint != b_taint:
> +            output.append("Taint (by forced/invalidated task) changed from %s to %s" % (a_taint, b_taint))
> +
> +        return output
>
>
>  def calc_basehash(sigdata):
>

