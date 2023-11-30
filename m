Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29754C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:58:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.71488.1701349108148380392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0rI9aOM;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50bba815f30so1237772e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 04:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701349106; x=1701953906; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK6jkec186aY+ZKfgqZjvI/oEE6myoDA5kfP/IKw8Ck=;
        b=m0rI9aOMTEoC8kk9ky34JGg42HgqKw7qiExfFkaNon+5Q9pxkkIS5o3DLBmRkIjB4Q
         iASsYmqUMRT8OPHuITYBh6bvC89RMZg15d8vwR+vAR18sBx55NSTKpbFcoHz5Bu9xMTo
         xZcwEhjnR2UaOwCpx2Z1rSUY86vPTtByhWFcom7GWtoEo5YD871mKlDR2UyjpBKD1ORy
         9Y7Wokq/IsUww6C8Z+Aq313z131MuY/Wzx+EDw58ArbyVH18dkk+YKa/i+OzKWFX4QXs
         fxIxz+usIVUaJSZ9iklKS3Kw7xN+8ODtCMD7l99dzvDHlBqLLKsAhgYxBugsvIjIcOVi
         SC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701349106; x=1701953906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DK6jkec186aY+ZKfgqZjvI/oEE6myoDA5kfP/IKw8Ck=;
        b=MtGYqa6uId/FbB3pxtTJLPGaOXFF2iJTj4kwWs0cS4MlBiun5AmR9s/LPA8RxN5Nd/
         5/wmBqtA6KEnjpVkJkLioHUeNELMji1XSby3Kn/avBVohxOvwitIkwK3ndnHtN1na1vu
         Znw/fTt0gBMRShqKJD1I9P1cAzewgFbU3ko1DKtc2zHaJKpsordLoVCF2B3l2hUNk0qG
         6OSNRTX05fjcRVCwJ0ePXCvQ0hg+VkKsv3HHdOdgotn79EvBwvjYgC91DhO1KqIFccP7
         vMS83wdgVinGgqy/+mWZZxQjUgm2GN0Ux3rmOyiaYPRkkBGqVRK1A+iUEnNVC2s11wzp
         cdhA==
X-Gm-Message-State: AOJu0Yy4EgxHsJ1VXR7oCRQzbj1pWoiZRIGHKRQfoc2oOO22yqZx07kd
	ZECD7mHK9b8GMGahgWalVwBWKJk8yEzJatMuJR0=
X-Google-Smtp-Source: AGHT+IFYJmI21eaa0TICgYD9LkDIUwnW1XnDcXPP3z1y6fLUs3iPTqSadu8IspDvMH8pmOgDBHu8dDBFXStmbfhDPCw=
X-Received: by 2002:ac2:495b:0:b0:50b:c13f:744f with SMTP id
 o27-20020ac2495b000000b0050bc13f744fmr4557187lfi.59.1701349105990; Thu, 30
 Nov 2023 04:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20231130081525.2537624-1-tobiasha@axis.com> <20231130081525.2537624-2-tobiasha@axis.com>
In-Reply-To: <20231130081525.2537624-2-tobiasha@axis.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 30 Nov 2023 05:58:14 -0700
Message-ID: <CAJdd5GZQcvFdLgXyyxuSBsi576MdYY_idXgELpQYzcP4tsGH_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] hashserv: Unihash cache
To: Tobias Hagelborn <tobias.hagelborn@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191508

On Thu, Nov 30, 2023 at 1:15=E2=80=AFAM Tobias Hagelborn
<tobias.hagelborn@axis.com> wrote:
>
> Cache unihashes to off-load reads of existing unihashes.
> Due to non reproducible builds, the output hash has to be considered.
> Only return a unihash if the output hash matches.
> The cache is least-recently-used (LRU) and bound in size.
>
> Data from handle_report and query_equivalent are inserted in the
> unihash cache. This caches unihashes from the database that have
> not been written during the current session.

Is the purpose of this to prevent needing to talk to the database?
Clients are generally doing client side caching, which means they
won't request unihashes they already know about in the first place.

The tricky part here is that we are trying to keep the server
stateless (stats excluded, but on the TODO list) so that multiple
instances can be run at the same time while talking to the same
backend SQL server for load-balancing and redundancy. Not to say that
caching can't work, but it still needs to be correct even if this
server doesn't see all of the RPC calls that manipulate the database.
If we are going to add state, I think we'll need to expand the test
suite to test the different API calls across multiple server (TBH, we
should probably be doing this already, but since the server is
stateless it's a lot easier to prove it works).

I'll look this over and see if I can reason through its correctness
w.r.t multiple server (or if you've done that please reply with your
assertions), but tests for that would help _substantially_ :)

>
> Stats have been added for hits, misses and size of the unihash cache.
>
> Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
> ---
>  lib/hashserv/server.py | 188 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 159 insertions(+), 29 deletions(-)
>
> diff --git a/lib/hashserv/server.py b/lib/hashserv/server.py
> index a8650783..3bfd4e2f 100644
> --- a/lib/hashserv/server.py
> +++ b/lib/hashserv/server.py
> @@ -4,6 +4,8 @@
>  #
>
>  from datetime import datetime, timedelta
> +from collections import OrderedDict
> +from collections.abc import MutableMapping
>  import asyncio
>  import logging
>  import math
> @@ -95,17 +97,34 @@ class Sample(object):
>
>
>  class Stats(object):
> -    def __init__(self):
> +
> +    named_stats =3D (
> +        'average',
> +        'equivs',
> +        'max_time',
> +        'num',
> +        'stdev',
> +        'total_time',
> +        'unihash_cache_hits',
> +        'unihash_cache_inserts',
> +        'unihash_cache_misses',
> +        'unihash_cache_size',
> +    )
> +
> +    def __init__(self, unihash_cache):
>          self.reset()
> +        self.unihash_cache =3D unihash_cache
>
>      def reset(self):
> -        self.num =3D 0
> -        self.total_time =3D 0
> -        self.max_time =3D 0
>          self.m =3D 0
>          self.s =3D 0
>          self.current_elapsed =3D None
>
> +        self.num =3D 0
> +        self.total_time =3D 0
> +        self.max_time =3D 0
> +        self.equivs =3D 0
> +
>      def add(self, elapsed):
>          self.num +=3D 1
>          if self.num =3D=3D 1:
> @@ -136,12 +155,24 @@ class Stats(object):
>              return 0
>          return math.sqrt(self.s / (self.num - 1))
>
> -    def todict(self):
> -        return {
> -            k: getattr(self, k)
> -            for k in ("num", "total_time", "max_time", "average", "stdev=
")
> -        }
> +    @property
> +    def unihash_cache_hits(self):
> +        return self.unihash_cache.stats_hits
>
> +    @property
> +    def unihash_cache_inserts(self):
> +        return self.unihash_cache.stats_inserts
> +
> +    @property
> +    def unihash_cache_misses(self):
> +        return self.unihash_cache.stats_misses
> +
> +    @property
> +    def unihash_cache_size(self):
> +        return len(self.unihash_cache)
> +
> +    def todict(self):
> +        return {k: getattr(self, k) for k in self.named_stats}
>
>  token_refresh_semaphore =3D asyncio.Lock()
>
> @@ -232,6 +263,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
>          upstream,
>          read_only,
>          anon_perms,
> +        unihash_cache
>      ):
>          super().__init__(socket, "OEHASHEQUIV", logger)
>          self.db_engine =3D db_engine
> @@ -242,6 +274,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
>          self.read_only =3D read_only
>          self.user =3D None
>          self.anon_perms =3D anon_perms
> +        self.unihash_cache =3D unihash_cache
>
>          self.handlers.update(
>              {
> @@ -413,20 +446,23 @@ class ServerClient(bb.asyncrpc.AsyncServerConnectio=
n):
>
>                  (method, taskhash) =3D l.split()
>                  # self.logger.debug('Looking up %s %s' % (method, taskha=
sh))
> -                row =3D await self.db.get_equivalent(method, taskhash)
> -
> -                if row is not None:
> -                    msg =3D row["unihash"]
> -                    # self.logger.debug('Found equivalent task %s -> %s'=
, (row['taskhash'], row['unihash']))
> -                elif self.upstream_client is not None:
> -                    upstream =3D await self.upstream_client.get_unihash(=
method, taskhash)
> -                    if upstream:
> -                        msg =3D upstream
> -                    else:
> -                        msg =3D ""
> -                else:
> -                    msg =3D ""
> -
> +                unihash =3D self.unihash_cache.get_hash(method,taskhash)
> +                if not unihash:
> +                    row =3D await self.db.get_equivalent(method, taskhas=
h)
> +
> +                    if row is not None:
> +                        unihash =3D row['unihash']
> +                        # self.logger.debug('Found equivalent task %s ->=
 %s', (row['taskhash'], row['unihash']))
> +                        self.request_stats.equivs+=3D1
> +                    elif self.upstream_client is not None:
> +                        upstream =3D await self.upstream_client.get_unih=
ash(method, taskhash)
> +                        if upstream:
> +                            unihash =3D upstream
> +                # Cache the found item in the read cache
> +                msg =3D ""
> +                if unihash:
> +                    self.unihash_cache.insert_hash(method, taskhash, uni=
hash, outhash=3DNone)
> +                    msg =3D unihash
>                  await self.socket.send(msg)
>              finally:
>                  request_measure.end()
> @@ -461,6 +497,16 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection=
):
>      # report is made inside the function
>      @permissions(READ_PERM)
>      async def handle_report(self, data):
> +
> +        unihash =3D self.unihash_cache.get_hash(data['method'],data['tas=
khash'],data['outhash'])
> +        if unihash:
> +            d =3D {
> +                'taskhash': data['taskhash'],
> +                'method': data['method'],
> +                'unihash': unihash,
> +            }
> +            return d
> +
>          if self.read_only or not self.user_has_permissions(REPORT_PERM):
>              return await self.report_readonly(data)
>
> @@ -511,11 +557,13 @@ class ServerClient(bb.asyncrpc.AsyncServerConnectio=
n):
>          else:
>              unihash =3D data["unihash"]
>
> -        return {
> -            "taskhash": data["taskhash"],
> -            "method": data["method"],
> -            "unihash": unihash,
> -        }
> +        d =3D {
> +                'taskhash': data['taskhash'],
> +                'method': data['method'],
> +                'unihash': unihash,
> +            }
> +        self.unihash_cache.insert_hash(d['method'], d['taskhash'], uniha=
sh, data['outhash'])
> +        return d
>
>      @permissions(READ_PERM, REPORT_PERM)
>      async def handle_equivreport(self, data):
> @@ -738,6 +786,85 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection=
):
>              "permissions": self.return_perms(self.user.permissions),
>          }
>
> +# LRU Cache Dict based on work by Alex Martelli and martineau used under=
 CC BY 4.0
> +# https://stackoverflow.com/a/2438926
> +class LRUCache(MutableMapping):
> +    def __init__(self, maxlen, items=3DNone):
> +        self._maxlen =3D maxlen
> +        self.d =3D OrderedDict()
> +        if items:
> +            for k, v in items:
> +                self[k] =3D v
> +
> +    @property
> +    def maxlen(self):
> +        return self._maxlen
> +
> +    def __getitem__(self, key):
> +        self.d.move_to_end(key)
> +        return self.d[key]
> +
> +    def __setitem__(self, key, value):
> +        if key in self.d:
> +            self.d.move_to_end(key)
> +        elif len(self.d) =3D=3D self.maxlen:
> +            self.d.popitem(last=3DFalse)
> +        self.d[key] =3D value
> +
> +    def __delitem__(self, key):
> +        del self.d[key]
> +
> +    def __iter__(self):
> +        return self.d.__iter__()
> +
> +    def __len__(self):
> +        return len(self.d)
> +
> +
> +class UnihashCache():
> +    """
> +    Size limited LRU cache (dict) of taskhash->(unihash,output-hash)
> +    if output-hash is provided, take it into account when matching,
> +    otherwise only map task-hash to unihash.
> +    """
> +
> +    def __init__(self, maxlen=3D0x20000):
> +        self.hash_cache =3D LRUCache(maxlen)
> +        self.stats_hits =3D 0
> +        self.stats_inserts =3D 0
> +        self.stats_misses =3D 0
> +
> +    def get_hash(self, method, taskhash, outhash=3DNone):
> +        method_hash =3D hash(method)
> +        taskhash_hash =3D hash(taskhash)
> +        cache_entry =3D self.hash_cache.get((method_hash,taskhash_hash))
> +        result =3D None
> +        if cache_entry:
> +            if not outhash:
> +                result =3D cache_entry[0]
> +            else:
> +                outhash_hash =3D hash(outhash)
> +                if outhash_hash =3D=3D cache_entry[1]:
> +                    result =3D cache_entry[0]
> +                else:
> +                    result =3D None
> +        if result:
> +            self.stats_hits +=3D 1
> +        else:
> +            self.stats_misses +=3D 1
> +        return result
> +
> +    def insert_hash(self, method, taskhash, unihash, outhash=3DNone):
> +        method_hash =3D hash(method)
> +        taskhash_hash =3D hash(taskhash)
> +        outhash_hash =3D hash(outhash) if outhash else None
> +        cache_key=3D(method_hash,taskhash_hash)
> +        if not self.hash_cache.get(cache_key):
> +            self.hash_cache[cache_key] =3D (unihash, outhash_hash)
> +            self.stats_inserts +=3D 1
> +
> +    def __len__(self):
> +        return len(self.hash_cache)
>
>  class Server(bb.asyncrpc.AsyncServer):
>      def __init__(
> @@ -765,11 +892,13 @@ class Server(bb.asyncrpc.AsyncServer):
>
>          super().__init__(logger)
>
> -        self.request_stats =3D Stats()
>          self.db_engine =3D db_engine
>          self.upstream =3D upstream
>          self.read_only =3D read_only
>          self.backfill_queue =3D None
> +        self.unihash_cache =3D UnihashCache()
> +        self.request_stats =3D Stats(self.unihash_cache)
> +
>          self.anon_perms =3D set(anon_perms)
>          self.admin_username =3D admin_username
>          self.admin_password =3D admin_password
> @@ -787,6 +916,7 @@ class Server(bb.asyncrpc.AsyncServer):
>              self.upstream,
>              self.read_only,
>              self.anon_perms,
> +            self.unihash_cache,
>          )
>
>      async def create_admin_user(self):
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191480): https://lists.openembedded.org/g/openembedde=
d-core/message/191480
> Mute This Topic: https://lists.openembedded.org/mt/102890273/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

