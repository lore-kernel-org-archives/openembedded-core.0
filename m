Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC57974D62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 02:23:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w482MvbC006070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2018 19:23:13 -0700
Received: from [128.224.16.192] (128.224.16.192) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 7 May 2018 19:22:47 -0700
To: Chen Qi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1525745853.git.Qi.Chen@windriver.com>
	<6d90dfb28dcf9eb98af81c0277d03547772fe1b7.1525745853.git.Qi.Chen@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <83120d79-16cb-b071-e481-ec221f2fcdf5@windriver.com>
Date: Tue, 8 May 2018 10:22:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <6d90dfb28dcf9eb98af81c0277d03547772fe1b7.1525745853.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] oe-depends-dot: print dependency chains for '--why' option
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
X-List-Received-Date: Tue, 08 May 2018 02:23:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05/08/2018 10:19 AM, Chen Qi wrote:
> When using '--why' option, we currently only list elements.
> It's better to print out dependency chains. This patch adds
> such abitility.
> 
> e.g.
>    $ oe-depends-dot -k util-linux -w recipe-depends.dot
>    Because: packagegroup-core-boot systemd-compat-units systemd shadow core-image-minimal dbus e2fsprogs
>    core-image-minimal -> packagegroup-core-boot -> systemd-compat-units -> systemd -> dbus -> shadow -> util-linux
>    core-image-minimal -> packagegroup-core-boot -> systemd-compat-units -> systemd -> dbus -> e2fsprogs -> util-linux

Looks great to me.

// Robert

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   scripts/oe-depends-dot | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
> index 5cec23b..6c7e9d3 100755
> --- a/scripts/oe-depends-dot
> +++ b/scripts/oe-depends-dot
> @@ -47,6 +47,51 @@ class Dot(object):
>           if len(sys.argv) != 3 and len(sys.argv) < 5:
>               print('ERROR: Not enough args, see --help for usage')
>   
> +    @staticmethod
> +    def insert_dep_chain(chain, rdeps, alldeps):
> +        """
> +        insert elements to chain from rdeps, according to alldeps
> +        """
> +        # chain should at least contain one element
> +        if len(chain) == 0:
> +            raise
> +
> +        inserted_elements = []
> +        for rdep in rdeps:
> +            if rdep in chain:
> +                continue
> +            else:
> +                for i in range(0, len(chain)-1):
> +                    if chain[i] in alldeps[rdep] and rdep in alldeps[chain[i+1]]:
> +                        chain.insert(i+1, rdep)
> +                        inserted_elements.append(rdep)
> +                        break
> +                if chain[-1] in alldeps[rdep] and rdep not in chain:
> +                    chain.append(rdep)
> +                    inserted_elements.append(rdep)
> +        return inserted_elements
> +
> +    @staticmethod
> +    def print_dep_chains(key, rdeps, alldeps):
> +        rlist = rdeps.copy()
> +        chain = []
> +        removed_rdeps = [] # hold rdeps removed from rlist
> +
> +        chain.append(key)
> +        while (len(rlist) != 0):
> +            # insert chain from rlist
> +            inserted_elements = Dot.insert_dep_chain(chain, rlist, alldeps)
> +            if not inserted_elements:
> +                if chain[-1] in rlist:
> +                    rlist.remove(chain[-1])
> +                    removed_rdeps.append(chain[-1])
> +                chain.pop()
> +                continue
> +            else:
> +                # insert chain from removed_rdeps
> +                Dot.insert_dep_chain(chain, removed_rdeps, alldeps)
> +                print(' -> '.join(list(reversed(chain))))
> +
>       def main(self):
>           #print(self.args.dotfile[0])
>           # The format is {key: depends}
> @@ -109,6 +154,7 @@ class Dot(object):
>                   if self.args.key in v and not k in reverse_deps:
>                       reverse_deps.append(k)
>               print('Because: %s' % ' '.join(reverse_deps))
> +            Dot.print_dep_chains(self.args.key, reverse_deps, depends)
>   
>   if __name__ == "__main__":
>       try:
> 

