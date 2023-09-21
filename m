Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C515E71093
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 16:14:48 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.22511.1695312886881761373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 09:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=becieL6z;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-503f39d3236so2020369e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695312885; x=1695917685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=736vb1w5QMfdCCa+73wrxLp8nPZS67RfFtWkDauQSjA=;
        b=becieL6zQf6FKlSDAlBlMaAenP4lo8hMoRZr+mT2pIdSo8auodx+00lGV7CzGoQtjb
         P8QdWq2/dHmor6FBrHBUy3m/BdORKCMTHRbfC6hSsanjPLk5YuuCp3ZWpVWKkag/CJyO
         rFUggIbTQ0Rs0muji9CfW458zgGSVzYKb3+AlcMuv522WqvjKNel50eHngWcnk6qFq1P
         TXM2LvNVAB0pWdaMtUvIUZXp6IgQuM2t7vC0ftP4eSifEJ7gTV5KSfMkdyVqftzGR8uG
         9hnXl6FZ/5qHq9FDKdUCH+ULRCwailK/s9XiOa6x1jfJQ5CsUcTRX7kODgdNCo30Ys/1
         j+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695312885; x=1695917685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=736vb1w5QMfdCCa+73wrxLp8nPZS67RfFtWkDauQSjA=;
        b=p9bnTaxrGiaI/JL3zvVsiZ/g9zSFzAaTdPDhyNiZCGG/2lKFTemY0RwnKuZ+xQ1+CP
         DX8SqJ9OMugyPYj2XrvzF90YPdUdLvUFjmmp9sAypQHc56BuqnXfH4iBv47JhYS+CUBZ
         40YzrG8jMQ2hzVz0TMxE2lRF5dJZyBijLLpqInJDUn+OMEc1dJtW3OULKRoYuAk2Pg/E
         sZIfkFsnnoOhSX6ify+VbOk1HYZDiedwCOFCkLDuPjENYgnUwr+XCNN7LXaE6/cePuOB
         bR0cPFhNRgtIs9l7mg/atht/DRRVYExD598GgsLpyjJcLrs30fhV4wjuE6FetNqEFq/A
         UZ0w==
X-Gm-Message-State: AOJu0YwPpS0XSVdylR4itrxDUkZiu8PULl8uTtwvyo6wseQ29cUU/jhb
	c1J5pG23YkfwgNMnwr5vIXNXyBgvf6ZloTpti6Q=
X-Google-Smtp-Source: AGHT+IHQgR8DBSql0MaMeh3yl0VB0QjAevJ5SsshxGTSVMNT0h39nm2wOvRGrtBk1IHYIrzn+RdghReHscU4IebHW+I=
X-Received: by 2002:a19:7009:0:b0:4fb:94c6:fd63 with SMTP id
 h9-20020a197009000000b004fb94c6fd63mr5140579lfc.17.1695312884616; Thu, 21 Sep
 2023 09:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230921100538.154753-1-tobias.hagelborn@axis.com>
In-Reply-To: <20230921100538.154753-1-tobias.hagelborn@axis.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 21 Sep 2023 10:14:32 -0600
Message-ID: <CAJdd5GYBunb001LeAoYA6f7+xNCJPSXNZ=aNPK5w+RWG1xr2+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] hashserv: Retry and sleep if database is locked
 on INSERT
To: Tobias Hagelborn <tobias.hagelborn@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 16:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188019

On Thu, Sep 21, 2023 at 4:08=E2=80=AFAM Tobias Hagelborn
<tobias.hagelborn@axis.com> wrote:
>
> From: Tobias Hagelborn <tobiasha@axis.com>
>
> Retry insert operations in case the database is locked by
> an external process. For instance an external cleanup or data
> retention transaction. Use async sleep to not block the event loop.

sqlite already handles this internally with a timeout specified in
sqlite3.connect(). The default is 5 seconds; I think it would be
better to add a command line option to the server that allows a longer
timeout to be specified instead of manually retrying.

Allowing multiple queries to run in parallel (a side effect of async)
might mess up the cursor.lastrowid tracking, so I'm a little leary of
doing that. The long blocks should only actually happen when you are
doing long maintenance operations, so an option for a longer timeout
on the server is probably better (and, maybe rework your cleanup to
not lock the database for so long)


>
> Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
> ---
>  lib/hashserv/server.py | 41 +++++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/lib/hashserv/server.py b/lib/hashserv/server.py
> index d40a2ab8..c898be3f 100644
> --- a/lib/hashserv/server.py
> +++ b/lib/hashserv/server.py
> @@ -9,6 +9,7 @@ import enum
>  import asyncio
>  import logging
>  import math
> +import sqlite3
>  import time
>  from . import create_async_client, UNIHASH_TABLE_COLUMNS, OUTHASH_TABLE_=
COLUMNS
>  import bb.asyncrpc
> @@ -114,7 +115,7 @@ class Resolve(enum.Enum):
>      REPLACE =3D enum.auto()
>
>
> -def insert_table(cursor, table, data, on_conflict):
> +async def insert_table(cursor, table, data, on_conflict):
>      resolve =3D {
>          Resolve.FAIL: "",
>          Resolve.IGNORE: " OR IGNORE",
> @@ -129,7 +130,19 @@ def insert_table(cursor, table, data, on_conflict):
>          values=3D", ".join(":" + k for k in keys),
>      )
>      prevrowid =3D cursor.lastrowid
> -    cursor.execute(query, data)
> +
> +    RETRIES =3D 5
> +    for x in range(RETRIES):
> +        try:
> +            cursor.execute(query, data)
> +        except sqlite3.OperationalError as e:
> +            if "database is locked" in str(e):
> +                await asyncio.sleep(1)
> +        finally:
> +            break
> +    else:
> +        cursor.execute(query, data)
> +
>      logging.debug(
>          "Inserting %r into %s, %s",
>          data,
> @@ -138,17 +151,17 @@ def insert_table(cursor, table, data, on_conflict):
>      )
>      return (cursor.lastrowid, cursor.lastrowid !=3D prevrowid)
>
> -def insert_unihash(cursor, data, on_conflict):
> -    return insert_table(cursor, "unihashes_v2", data, on_conflict)
> +async def insert_unihash(cursor, data, on_conflict):
> +    return await insert_table(cursor, "unihashes_v2", data, on_conflict)
>
> -def insert_outhash(cursor, data, on_conflict):
> -    return insert_table(cursor, "outhashes_v2", data, on_conflict)
> +async def insert_outhash(cursor, data, on_conflict):
> +    return await insert_table(cursor, "outhashes_v2", data, on_conflict)
>
>  async def copy_unihash_from_upstream(client, db, method, taskhash):
>      d =3D await client.get_taskhash(method, taskhash)
>      if d is not None:
>          with closing(db.cursor()) as cursor:
> -            insert_unihash(
> +            await insert_unihash(
>                  cursor,
>                  {k: v for k, v in d.items() if k in UNIHASH_TABLE_COLUMN=
S},
>                  Resolve.IGNORE,
> @@ -260,7 +273,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
>              elif self.upstream_client is not None:
>                  d =3D await self.upstream_client.get_taskhash(method, ta=
skhash)
>                  d =3D {k: v for k, v in d.items() if k in UNIHASH_TABLE_=
COLUMNS}
> -                insert_unihash(cursor, d, Resolve.IGNORE)
> +                await insert_unihash(cursor, d, Resolve.IGNORE)
>                  self.db.commit()
>
>          return d
> @@ -301,16 +314,16 @@ class ServerClient(bb.asyncrpc.AsyncServerConnectio=
n):
>
>          return d
>
> -    def update_unified(self, cursor, data):
> +    async def update_unified(self, cursor, data):
>          if data is None:
>              return
>
> -        insert_unihash(
> +        await insert_unihash(
>              cursor,
>              {k: v for k, v in data.items() if k in UNIHASH_TABLE_COLUMNS=
},
>              Resolve.IGNORE
>          )
> -        insert_outhash(
> +        await insert_outhash(
>              cursor,
>              {k: v for k, v in data.items() if k in OUTHASH_TABLE_COLUMNS=
},
>              Resolve.IGNORE
> @@ -386,7 +399,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
>                      outhash_data[k] =3D data[k]
>
>              # Insert the new entry, unless it already exists
> -            (rowid, inserted) =3D insert_outhash(cursor, outhash_data, R=
esolve.IGNORE)
> +            (rowid, inserted) =3D await insert_outhash(cursor, outhash_d=
ata, Resolve.IGNORE)
>
>              if inserted:
>                  # If this row is new, check if it is equivalent to anoth=
er
> @@ -427,7 +440,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
>                              unihash =3D upstream_data['unihash']
>
>
> -                insert_unihash(
> +                await insert_unihash(
>                      cursor,
>                      {
>                          'method': data['method'],
> @@ -460,7 +473,7 @@ class ServerClient(bb.asyncrpc.AsyncServerConnection)=
:
>                  'taskhash': data['taskhash'],
>                  'unihash': data['unihash'],
>              }
> -            insert_unihash(cursor, insert_data, Resolve.IGNORE)
> +            await insert_unihash(cursor, insert_data, Resolve.IGNORE)
>              self.db.commit()
>
>              # Fetch the unihash that will be reported for the taskhash. =
If the
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187987): https://lists.openembedded.org/g/openembedde=
d-core/message/187987
> Mute This Topic: https://lists.openembedded.org/mt/101496954/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

